require 'sinatra/base'

class Chitter < Sinatra::Base
  
  enable :sessions

  get '/' do
    erb :index
  end

  get '/users/sign_in' do
    erb :"users/sign_in"
  end

  post '/users/sign_in' do
    session[:name] = params[:name]
    redirect to '/'
  end

end
