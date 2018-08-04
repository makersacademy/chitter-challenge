require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/' do
    redirect '/login'
  end

  get '/login' do
    erb :login
  end

  post '/feed' do
    @username = params[:username]
    erb :feed
  end
end
