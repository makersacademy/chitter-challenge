require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup.rb'
require './lib/user'

class ChitterController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:login_page)
  end

  get '/create-account' do
    erb(:register)
  end

  post '/create-account' do
    if User.create(username: params[:username], email: params[:email], password: params[:password])
      flash[:notice] = "Account created succesfully, log in below!"
      redirect('/')
    else
      flash[:notice] = "Account name/email exist, try again!"
      redirect('/create-account')
    end
  end

  post '/sessions' do
    p params
  end

  run! if app_file == $0
end