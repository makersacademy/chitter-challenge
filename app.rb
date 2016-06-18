ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './model/user.rb'
class ChitterChatter < Sinatra::Base
  enable :sessions
  get '/' do
    erb :'users/new'
  end

  post '/add' do
    User.create(email: params[:email], password: params[:password])
    p 'user created'
    redirect('sign_in')
  end

  get '/sign_in' do
    erb :'users/sign_in'
  end

  run! if app_file == $0
end
