require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/chitter_feed' do
    @message = $message
    erb :chitter_feed
  end

  get '/new_message' do
    erb :new_message
  end

  post '/new_message' do
    $message = params[:message]
    redirect '/chitter_feed'
  end

  run! if app_file == $0
end