require 'sinatra/base'
require 'sinatra/flash'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    erb(:sign_up)
  end

  post '/users' do
    @name = params[:name]
    @username = params[:username]
    @password = params[:password]
    @email = params[:email]
    redirect '/peeps'
  end

  get '/peeps' do
    erb(:peeps)
  end

  


  run! if app_file == $0
end
