ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'rubygems'
require 'tilt/erb'
require 'byebug'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride

  enable :sessions
  set :sessions_secret, 'woobly-doobly'

  get '/' do
    erb(:index)
  end

  post '/users' do
    user = User.create(full_name:             params[:full_name],
                       username:              params[:username],
                       email:                 params[:email],
                       password:              params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/chits'
    else
      flash.now[:errors] = user.errors.full_messages
      erb(:index)
    end
  end

  post '/sessions' do
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect '/chits'
    else
      flash.now[:details_error] =
      'Incorrect username or password. Check your details or please sign up.'
      erb(:index)
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.now[:notice] = 'Thank you and goodbye!'
    erb(:index)
  end

  post '/create_chits' do
    chit = Chit.create(chit_text: params[:chit_text],
                       chit_time: Time.now.strftime("%d %b at %H:%M"), 
                       user_id: params[:user_id])
    chit.save
    redirect '/chits'
  end

  get '/chits' do
    @chits = Chit.all.reverse
    erb(:chits)
  end

  post '/create_reply' do
    reply = Reply.create(reply_text: params[:reply_text],
                         reply_time: Time.now.strftime("%d %b at %H:%M"),
                         chit_id: params[:chit_id], 
                         user_id: params[:user_id])

    reply.save
    redirect '/chits'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == 'app/app.rb'
end
