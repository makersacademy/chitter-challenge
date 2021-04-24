require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/message'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions, :method_override

  get '/' do
    erb(:'home')
  end

  get '/messages' do
    @messages = Message.all
    erb(:'messages')
  end

  post '/messages' do
    Message.create(params[:message])
    redirect '/messages'
  end

  run! if app_file == $0

end
