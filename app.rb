require 'sinatra/base'
require 'sinatra/flash'

require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  get '/join' do
    erb :join
  end

  post '/join' do
    if params[:password] == params[:confirmation]
      user = User.create(params[:handle], params[:password])
      redirect to '/peeps'
    else
      flash[:password_alert]
      redirect to '/join'
    end
  end

  get '/peeps' do
    erb :peeps
  end

  run! if app_file == $PROGRAM_NAME
end
