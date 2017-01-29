require 'sinatra/base'
#require_relative 'data_mapper_setup'
require_relative 'models/user'


class Chitter < Sinatra::Base

  get '/' do
    erb :'index'
  end

  get '/signup' do
    erb :'sign_up'
  end

  post '/registration' do
    User.new(name: params[:name],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password])
    redirect '/messenger'
  end

  get '/messenger' do

  end

  run! if $0 == 'app/app.rb'
end
