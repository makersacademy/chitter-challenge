require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do

  end

  get '/chit' do
    erb :chit
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    redirect '/chit'
  end

  get '/login' do

  end

end
