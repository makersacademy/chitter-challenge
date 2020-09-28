require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  
  enable :sessions
  run! if app_file == $0

  get '/' do
    # @user = User.find(session[:user_id])
    erb :index
  end

  post '/add' do
    Peep.create(text: params[:text]) unless params[:text].empty?
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    session[:username] = params['username']
    redirect '/'
  end

end