require 'rubygems'
require 'data_mapper'
require 'sinatra'
require 'sinatra/base'
require_relative './lib/peeps.rb'
require_relative './lib/user.rb'
require 'sinatra/flash'
require 'dm-postgres-adapter'

class Chitter < Sinatra::Base
   enable :sessions
   register Sinatra::Flash

   get '/' do
     @user = User.get(session[:user_id])
     p @peeps = Peeps.all
     erb (:index)
   end

   post '/' do
     @user = User.get(session[:user_id])
     Peeps.create(content: params[:peep_content], username: params[:peep_username])
     redirect '/'
   end

   get '/login' do
     erb :login
   end

   post '/login' do
     user = User.first(username: params[:log_username])
     session[:user_id] = user.id
     redirect '/'
   end

   get '/signup' do
     erb :signup
   end

   post '/signup' do
     user = User.create(username: params[:username], password: params[:password])
     session[:user_id] = user.id
     redirect '/signupcomplete'
   end

   get '/signupcomplete' do
     @user = User.get(session[:user_id])
     erb :signupcomplete
   end

   get '/logout' do
     session.clear
     erb :logoutcomplete
   end

   run! if app_file==$0

end
