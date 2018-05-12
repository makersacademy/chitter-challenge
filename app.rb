require 'sinatra/base'
require './lib/users.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/chitter' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    name, username, email, password = params[:name], params[:username], params[:email], params[:password]
    Users.create(name, username, email, password)
    redirect('/user_added')
  end

  get '/user_added' do
    erb :user_added
  end

  get '/sign_in' do
    erb :sign_in
  end

  get '/new_peep' do
    erb :new_peep
  end

  run! if app_file == $0
end
