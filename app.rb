require 'sinatra'
require './lib/user'
require './database_connection_setup'
require 'sinatra/flash'
require 'uri'

class Chitter < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash

  get '/homepage' do
    erb :index
  end

  get '/homepage/sign_in' do
    erb :sign_in
  end

  get '/homepage/sign_up' do
    erb :'homepage/sign_up'
  end

  post '/homepage/sign_up' do
     User.create(name: params[:name],
                email: params[:email],
                username: params[:username],
                password: params[:password]
                )
    redirect 'homepage/signed_up'
  end

  get '/homepage/signed_up' do
    erb :'homepage/signed_up'
  end

end
