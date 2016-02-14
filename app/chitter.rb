ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/peep'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    @peeps = Peep.all(:order => [ :time.desc ])
    erb :'peeps/home'
  end

  get '/peeps/new_peep' do
    erb :'peeps/new_peep'
  end

  post '/peeps' do
    t = Time.new
    display_time = "#{t.day}.#{t.month}.#{t.year} #{t.hour}:#{t.min}"
    peep = Peep.create(message: params[:message], title: params[:title], time: Time.new, dis_time: display_time)
    peep.save
    redirect '/'
  end

  get '/users/new_user' do
    @user = User.new
    erb :'users/new_user'
  end

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new_user'
    end
  end

  get '/sessions/sign_in' do
    erb :'sessions/sign_in'
  end

  post '/sessions' do
    user = User.authenticate(params[:name], params[:username], params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The name, username, email or password is incorrect']
      erb :'sessions/sign_in'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/'
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
