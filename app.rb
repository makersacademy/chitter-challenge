require 'sinatra'
require_relative './lib/peep'

class Chitter < Sinatra::Application

  enable :sessions 

  get '/' do
    'Welcome to Chitter!'
  end

  post '/message' do
    p $message = Peep.new(params[:message])
    redirect '/message'
  end

  get '/message' do
    if $message == nil
      Peep.new('')
    else
      @message = $message.message
    end
    erb :index
  end


  run! if app_file == $0
end