require 'pg'
require 'sinatra'
require 'sinatra/flash'
require_relative './lib/users.rb'


class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :home
  end

  post '/new-peep' do
    #some ruby, adding a cheep to the db

    redirect '/'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    Users.create(name: params[:name], email: params[:email], password: params[:password], username: params[:username])
    redirect '/sign-up-thanks'
  end

  get '/sign-up-thanks' do
    erb :su_thanks
  end

  run! if app_file == $0

end
