require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require './app/helpers/user.rb'

class Chitter < Sinatra::Base
include Helpers
use Rack::MethodOverride
register Sinatra::Flash
enable :sessions
set :session_secret, 'super secret'

  get '/' do
    erb :'home/index'
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new', layout: false
  end

  post '/user' do
    @user = User.create(username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      session[:username] = params[:username]
      redirect('/peep')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/peep' do
    @peeps = Peep.all
    erb :'peep/index'
  end

  get '/peep/new' do
    erb :'peep/new'
  end

  post '/peep' do
    t = Time.now
    peep = Peep.new(username: session[:username],
                    content: params[:content],
                    time: t.strftime("%b %e, %l:%M %p"))
    peep.save
    redirect('/peep')
  end

  get '/sessions/new' do
    erb :'sessions/new', layout: false
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      session[:username] = user.username
      redirect('/peep')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session.clear
    redirect('/')
  end

  # start the server if ruby file executed directly
  run! if app_file == Chitter
end
