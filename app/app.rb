ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'dm-validations'
require 'sinatra/flash'
require_relative '../data_mapper_setup'
require_relative 'models/user'
class ChitterChallenge < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/users/new' do
    User.create(email: params[:email], password: params[:password])
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end
    run! if app_file == $0
end
