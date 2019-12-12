require 'sinatra/base'
require './lib/maker'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/signup' do
    Maker.create(email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username])
      redirect :peep
    end

    run! if app_file == $0
  end
