require 'sinatra'
require 'sinatra/base'
require './lib/peep'
require 'sinatra/flash'
require './database_connection_setup'

 class Chitter < Sinatra::Base

   configure do
     # use Rack::MethodOverride
     enable :sessions
     register Sinatra::Flash
   end

   get '/' do
     redirect '/peeps'
   end

   get '/peeps' do
     @user = User.find(session[:user_id])
     @peeps = Peep.all
     erb :"/peeps/index"
   end

   post '/peeps' do
     Peep.create(params[:peep])
     redirect '/peeps'
   end

   get '/users/new' do
     erb :"users/new"
   end

   post '/users' do
     @user = User.create(params['email'], params['password'])
     session[:user_id] = @user.id
     redirect '/'
   end

 end
