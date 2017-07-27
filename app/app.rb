
ENV['RACK_ENV'] ||= 'development'
require_relative 'chitter_setup'
require 'sinatra/base'
require 'sinatra/flash'


class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'


  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
   def date_and_time(time)
      time.strftime("%c")
   end
  end

  get '/' do
    erb :index
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    if params[:peep_content] != ""
      Peep.create(content: params[:peep_content], user_id: current_user.id)
      redirect to('/peeps')
    else
      flash.now[:notice] = "Please enter a message for your peep"
      erb :'/peeps/new'
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    # User.all.each {|u| u.destroy}
    user = User.create(email: params[:email], username: params[:username], password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    if user.save
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

end
