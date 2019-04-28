require 'sinatra'
require_relative './lib/peep'

class Chitter < Sinatra::Application

  enable :sessions 

  get '/' do
    'Welcome to Chitter!'
  end

  post '/message' do
    Peep.create(params[:message])
    redirect '/message'
  end

  get '/message' do
    @messages = Peep.all
    erb :index
  end


  run! if app_file == $0
end