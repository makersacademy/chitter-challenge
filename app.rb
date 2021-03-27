require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :chitter
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/peeps' do
    redirect '/peeps'
  end

  get '/peeps' do
    erb :peeps
  end
 end
