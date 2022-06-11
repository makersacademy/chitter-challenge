require 'sinatra/base'
require 'sinatra/reloader'

class ChitterChat < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/login' do
    erb :logging_in
  end


  post '/login' do
    @first_name = params[:first_name]
    @surnename = params[:surname]
    @email = params[:email]
    @password = params[:password]
    redirect '/login'

  end

  run! if app_file == $0
end