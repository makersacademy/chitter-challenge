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
     @user = User.find(session[:user_id])
     erb :feed
   end

   get '/feed/new_peep' do
     erb :new_peep
   end

   post '/feed' do
     Peep.add(params[:new_peep])
#     Peep.add(params[:new_peep], User.find(session[:user_id]))
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

#    post '/register' do
# #     redirect '/feed' if User.find_user(params[:email])
#      user = User.add_new(params[:name], params[:email], params[:password])
#      session[:user_id]
#      redirect '/feed'
#    end

end
