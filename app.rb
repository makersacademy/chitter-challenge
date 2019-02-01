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
  #   @user = User.find(session[:user_id]).name || "Anonymous"
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
#
#    get '/login' do
#      erb :login
#    end
#
#    post '/register' do
# #     redirect '/feed' if User.find_user(params[:email])
#      user = User.add_new(params[:name], params[:email], params[:password])
#      session[:user_id]
#      redirect '/feed'
#    end

end
