require 'sinatra'
require 'data_mapper'

class Chitter < Sinatra::Base

  configure :development do
    DataMapper.setup(:default, "postgres://localhost/chitter")
  end

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
