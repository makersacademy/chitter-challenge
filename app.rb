require 'sinatra/base'

class Chitter < Sinatra::Base
   get '/' do
     erb :index
   end

   get '/login' do
     erb :login
   end

   get '/register' do
     erb :register
   end

   get '/peeps' do
     erb :peeps
   end

   get '/peeps/new' do
     erb :create_peep
   end

   run! if app_file == $0
end
