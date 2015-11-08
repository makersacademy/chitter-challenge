# ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    erb :homepage
  end

  get '/signup' do
    erb :sign_up
  end

  post '/signup' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end

  run! if app_file == $0
end
