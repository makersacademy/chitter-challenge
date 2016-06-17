require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/register' do
    erb(:register)
  end

  post '/register' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password], username: params[:username])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
