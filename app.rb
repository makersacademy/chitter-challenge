require 'sinatra/base'
require './lib/peep'
require './lib/database_connection'
require_relative 'setup_db_connection'

require './lib/user'

class Chitter < Sinatra::Base

#  disable :show_exceptions
   enable :sessions

   setup

   get '/' do
     erb :home
   end

   get '/feed' do
     @peeps = Peep.all
     existing_user = User.find(session[:user_id])
     @user = existing_user ? existing_user :  User.find_or_create_anon_user
     erb :feed
   end

   get '/feed/new_peep' do
     erb :new_peep
   end

   post '/feed' do
     Peep.add(params[:new_peep], session[:user_id])
     redirect '/feed'
   end

   get '/users/new' do
     erb :"users/new"
   end

   post '/users' do
     user = User.add_new(name: params[:name], email: params[:email], password: params[:password])
     session[:user_id] = user.id
     redirect '/feed'
   end

   get '/users/logout' do
     session[:user_id] = nil
     redirect '/feed'
   end

end
