require 'sinatra'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chits' do
    @chit = session[:chit]
    erb :chits
  end

  post '/chits' do
    session[:chit] = params[:chit]
    redirect '/chits'
  end
end
