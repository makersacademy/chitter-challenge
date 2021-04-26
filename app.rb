require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/peeps'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end
  
  get '/' do
    erb :"peeps/home"
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :"peeps/index"
  end

  get '/peeps/new' do
    erb :"peeps/new"
end

  post '/peeps' do
    Peeps.create(params[:peep])
    redirect '/peeps'
  end
   get '/user' do
     erb :"peeps/user"
   end

   post '/user/create' do
     redirect '/'
   end

  run! if app_file == $0
end