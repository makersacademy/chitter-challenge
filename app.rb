require 'sinatra'
require "sinatra/reloader" if development?
require 'sinatra/flash'
require 'uri'
require './lib/peep'
require './lib/user'



class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  # get '/' do
  #   erb :home
  # end
  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/registrations/sign_up' do
    erb :'registrations/sign_up'
  end

  post '/registrations' do
    @user = User.create(id: params[:id], first_name: params[:first_name], last_name: params[:last_name], email: params[:email], user_password: params[:user_password])
    session[:user_id] = @user.id
    redirect '/peeps'
  end

 get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
   @user = User.find_by(email: params['email'], user_password: params['user_password'])
   if @user
    session[:user_id] = @user.id
    redirect '/peeps'
   else
    redirect '/sessions/login'
   end
  end

  get '/sessions/log_out' do
    session.clear
    redirect '/peeps'
  end

  get '/peeps/new' do
    @user = session[:user_id]
    if @user
    erb :'peeps/new'
    else
      redirect '/peeps'
    end
  end

  post '/peeps' do
    Peep.create(peep: params[:peep])
    redirect '/peeps'
  end

  # Start the server if this file is executed directly 
  # (do not change the line below)
  run! if app_file == $0
end