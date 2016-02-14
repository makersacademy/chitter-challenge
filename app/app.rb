ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'rack-flash'
require 'sinatra/partial'

class Chitter < Sinatra::Base

   enable :sessions
   use Rack::Flash
   register Sinatra::Partial
   set :partial_template_engine, :erb

   get '/sessions/new' do
     erb :'sessions/new'
   end

   post '/sessions/new' do
     user = User.authenticate(params[:email], params[:password])
     if user
      session[:id] = user.id
      redirect to('/sessions/welcome')
     else
      redirect to('/sessions/failed')
     end
   end

   get '/sessions/welcome' do
     @user = current_user
     erb :'sessions/welcome'
   end

   get '/sessions/failed' do
     erb :'sessions/failed'
   end

   post '/sessions' do
     session[:id] = nil
     flash[:notice] = 'goodbye!'
     redirect to '/users/new'
   end


   get '/users/new' do
    erb :'users/new'
   end

   post '/users/new' do
     user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])

     session[:id] = user.id
     redirect to('/users/welcome') unless user.id.nil?
     #TODO use Sinatra::flash instead then reg_failed
     redirect to('/users/failed')
   end

   get '/users/welcome' do
     @user = current_user
     erb :'users/welcome'
   end

   get '/users/failed' do
     erb :'users/failed'
   end

   helpers do
    def current_user
      id = session[:id]
      @current_user ||= User.get(id)
    end
   end

  run! if app_file == $0

end

