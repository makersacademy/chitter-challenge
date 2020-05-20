require 'sinatra/base'

class Chitter < Sinatra::Base
   get '/' do
     erb :index
   end

   get '/login' do
     erb :login
   end

   post '/login' do
     #params here
     redirect '/peeps'
   end

   get '/register' do
     erb :register
   end

   post '/register' do
     #params here
     redirect '/peeps'
   end

   get '/peeps' do
     erb :peeps
   end

   get '/peeps/new' do
     erb :create_peep
   end

   post '/peeps' do
     #params here
     redirect '/peeps'
   end

   run! if app_file == $0
end
