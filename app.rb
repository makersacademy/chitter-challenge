require 'sinatra/base'
require 'rack'

 class App < Sinatra::Base

   enable :sessions

   get '/' do
     @new_peep = session[:new_peep]
     erb :homepage
   end

   post '/peep' do
     session[:new_peep] = params[:peep]
     redirect '/'
   end

   run! if app_file == $0

end
