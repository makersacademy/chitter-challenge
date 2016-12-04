ENV["RACK_ENV"] ||= "development"

require './app/data_mapper_setup.rb'
require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :'sign_up'
  end

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/sign_up' do
    User.new(email: params[:email], password:params[:password],
    password_again: params[:password_again], handle: params[:handle])
    redirect to('/new')
  end

  get '/new' do
    erb :'new'
  end

  post 'new' do
    peeps = Peep.new(name: params[:name])
    redirect to('/peeps')
  end

  post '/peeps' do

  end

  get '/peeps' do
    erb :'peeps'
  end

  helpers do
    def current_user
      User.first(id: session[user_id])
    end
  end

  run! if app_file == $0
end
