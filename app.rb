require './database_setup.rb'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/peeps' do
    flash.now[:message] = 'No peeps posted yet!'
    @username = session[:username]
    erb :peeps
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    session[:username] = params[:username]
    redirect '/peeps'
  end

  run! if app_file == $PROGRAM_NAME
end
