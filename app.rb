ENV['RACK_ENV'] ||= 'development'
require 'pg'
require 'sinatra/base'
require_relative './lib/user'

class ChitterApp < Sinatra::Base
  p ENV['RACK_ENV']

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    # p params
    @user = User.new(params[:name], params[:last_name], params[:username], params[:email], params[:password])
    redirect '/feed'
  end

  get '/feed' do
    "lists all the peeps"
    # @chitter = Chitter.list => need to be an array
    # erb :feed
  end

  run! if app_file == $0
end
