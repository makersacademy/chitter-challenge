require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message.rb'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to chitter'
  end

  get '/chitter' do
    @messages = Message.all
    erb(:'chitter/index')
  end

  get '/chitter/new' do
    erb(:'chitter/new')
  end

  post '/chitter' do
    text = params[:text]
    con = PG.connect(dbname: 'chitter_test')
    con.exec("INSERT INTO messages (text) VALUES ('#{text}')")
    redirect ('/chitter')
  end
  
end