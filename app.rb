ENV["RACK_ENV"] ||= 'development'

require 'sinatra'
require 'sinatra/activerecord'
require './lib/user'


set :database_file, "config/database.yml"

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create(email: params[:email], password: params[:password], name: params[:name], username: params[:username])
    redirect '/'
  end

end