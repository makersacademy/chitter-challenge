require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/message' do
    session[:message] = params[:message]
    redirect to('/chitter_board')
  end

  get '/chitter_board' do
    @message = session[:message]
    erb :chitter_board
  end

end