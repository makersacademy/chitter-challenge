require 'sinatra'
require './lib/user'
require './lib/peep'
require './database_connection_setup'
require 'sinatra/flash'
require 'uri'

class Chitter < Sinatra::Base
  enable :method_override, :sessions
  register Sinatra::Flash

  get '/homepage' do
    erb :index
  end

  get '/chitter' do
    @peeps = Peep.all
    erb :chitter
  end

  post '/chitter/new_peep' do
    Peep.create(text: params[:text], user_id: session[:user].id)
    redirect '/chitter'
  end

  get '/homepage/sign_in' do
    erb :'homepage/sign_in'
  end

  post '/homepage/sign_in' do
    session[:user] = User.log_in(username: params[:username], password: params[:password])
    redirect '/chitter'
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

  post '/sign-out' do
    session.clear
    flash[:notice] = 'You have successfully signed out'
    redirect '/homepage'
  end

end
