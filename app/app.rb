ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require './app/data_mapper_setup'

class ChitterManager < Sinatra::Base

  set :sessions, true

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :signup
  end

  post '/users' do
    User.create(email: params[:email], name: params[:name], password: params[:password], username: params[:username])
    redirect '/welcome_page'
  end

  get "/welcome_page" do
    @user = User.last
    p @user
    erb :welcome_page
  end

  run! if app_file == $0
end
