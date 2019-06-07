require 'sinatra/base'
require './lib/username'

class ChitterManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up/username' do
    Username.create(params[:username])
    redirect '/peeps'
  end

  get '/peeps' do
    'Welcome'
    # erb :peeps
  end
end
