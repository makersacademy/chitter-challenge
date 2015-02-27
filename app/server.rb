require 'sinatra/base'
require 'data_mapper'
require_relative 'models/user'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'models/message'

DataMapper.finalize

DataMapper.auto_upgrade!

class Chitter < Sinatra::Base

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/' do 
    erb :index
  end

  get '/user' do 
    erb :user
  end

  post '/user' do
    erb :user
  end
  
  post '/messages' do 
    content = params[:content]
    Message.create(:content => content)
    redirect to '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
