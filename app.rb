require 'sinatra/base'
require_relative './lib/messages'

class Chitter < Sinatra::Base
  enable :sessions


  get '/' do
    # p "_____________ #{@message}"
    @message = Messages.all
    erb :index
  end

  post '/add_message' do
    Messages.add(message: params[:message])
    redirect '/'
  end  

  run! if app_file == $0

end