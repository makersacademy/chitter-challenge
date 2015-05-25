require 'data_mapper'
require 'sinatra'

env = ENV['RACK_ENV'] || 'development'


DataMapper.setup(:default, "postgres://localhost/chatter_#{env}")

require_relative 'models/message'

DataMapper.finalize

DataMapper.auto_upgrade!



class Chatter < Sinatra::Base

  get '/' do
    @messages = Message.all
    erb :index
end

post '/peeps' do
  peep = params['peep']
  username = params['username']
  Message.create(peep: peep, username: username)
  redirect to('/')
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
