# require 'sinatra'
require 'sinatra/base'

class ChitterApp < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/enter' do
    session[:message] = params[:message]
    @msg = session[:message]
    erb :list_msgs
  end

  # start the server if ruby file executed diectly
  run! if app_file == $0

end
