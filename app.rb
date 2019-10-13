require 'sinatra/base'
require_relative 'lib/message'

class Chitter < Sinatra::Base
  enable :sessions

  not_found do
     erb :error
   end

  get '/' do
    erb :index
  end

  post '/messages' do
    @chitter_message = params[:chitter_message]
    erb :messages
  end

  get '/messages' do
    @chitter_message = params[:chitter_message]
    erb :messages
  end

  run! if app_file == $0

end
