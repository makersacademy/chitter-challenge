require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :homepage
  end

  get '/registration' do
    erb :registration
  end

  post '/registration' do
    user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
    redirect to '/chitter'
  end

  get '/sign_in' do
    erb :sign_in
  end

  get '/chitter' do

  end
end
