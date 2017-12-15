ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/user/new' do
    erb(:signup)
  end

  post '/user' do
    User.create(email: params[:email], name: params[:name], username: params[:username], password: params[:password])
    redirect('/')
  end

  run! if app_file == $0

end
