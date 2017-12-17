ENV['RACK_ENV'] ||= 'development'
# ENV['RACK_ENV'] ||= 'test'

require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'

require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secretpass'

  register Sinatra::Flash

  get '/' do
   erb :index
  end

  get '/messages' do
    @messages = Message.all(:order => [:created_at.desc])
    erb :'messages/messages'
    end

  get '/messages/new' do
    erb :'messages/new_messages'
  end

  post '/messages/new' do
    Message.create(user_id: current_user.id, message: params[:message])
    redirect '/messages'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new_user'
  end

  post '/users/new' do
    @user = User.create(user_name: params[:user_name],
                      user_email: params[:user_email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation]
                    )

    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.user_name
      redirect '/'
    else
      flash.now[:email_notice] = "Please provide a valid email address"
      flash.now[:password_notice] = "Password and confirmation password do not match"
      erb :'users/new_user'
    end

  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/sessions/new' do
      erb :'sessions/new_session'
  end

  post '/sessions' do
      user = User.authenticate(params[:user_email], params[:password])
      if user
        session[:user_id] = user.id
        redirect to '/messages'
      else
        flash.now[:log_in_notice] = 'Your email or password is incorrect'
        erb :'sessions/new_session'
      end
  end


  # run if file is run directly by Ruby
  run! if app_file == $0

end
