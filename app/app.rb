ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './data_mapper_setup.rb'
require_relative './models/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/signup' do
    # @user = User.new
    erb(:signup)
  end

  post '/home' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    # require 'pry'; binding.pry
    redirect '/home'
  end

  get '/home' do
    @user = User.first(:email)
    erb(:home)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
