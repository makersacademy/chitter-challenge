require 'sinatra/base'
require 'data_mapper'
require 'rack-flash'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chittter_#{env}")

require './lib/user'
require './lib/peep'
require './lib/reply'
require './helpers'

DataMapper.finalize
DataMapper.auto_upgrade!

# require_relative 'controllers/app'

class Chittter < Sinatra::Base
  enable :sessions
  use Rack::Flash
  use Rack::MethodOverride

  include Helpers

  # dont want free floating methods
  # def welcome
  #   @who_to_welcome = "Welcome, #{session[:username]}" if session[:username]
  # end

  # def get_and_sort_peeps
  #   @peeps = Peep.all
  #   @sorted = @peeps.each.sort{|a, b| b.time <=> a.time}
  # end

  get '/' do
    get_and_sort_peeps
    welcome
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation],
                name: params[:name],
                username: params[:username])
    if user.save
      session[:username] = params[:name]
      redirect to('/')
    else
      flash[:errors] = user.errors.full_messages
     # flash[:message] = 'email or password is incorrect'
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:username] = user.username
      redirect('/')
    else
      flash[:message] = 'email or password is incorrect'
      redirect('/sessions/new')
    end
  end

  delete '/sessions' do
    session[:username] = nil
    flash[:notice] = 'you have logged out successfully'
    redirect('/')
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    if session[:username]
      Peep.create(content: params[:peep], time: Time.new, user: session[:username])
    end
    redirect('/')
  end

  get '/reply/:id' do
    @logged_in = session[:username]
    session[:reply_id] = params[:id]
    erb :reply
  end

  post '/reply' do
    reply = Reply.create(reply: params[:reply])
    peep = Peep.first(id: session[:reply_id])
    peep.replys << reply
    peep.save
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
