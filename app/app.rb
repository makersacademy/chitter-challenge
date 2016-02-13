require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    'Home Page'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/new_user' do
    User.create(name: params[:name], email: params[:email],
      username: params[:username], password: params[:password])
    redirect('/')
  end

  run! if app_file == $0
end