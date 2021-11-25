require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index, :layout => :main_layout
  end

  get '/chitter' do
    @chitter = Chitter.all
    erb :chitter, :layout => :main_layout
  end 

  get '/chitter/new' do 
    erb :new, :layout => :main_layout
  end 

  post '/chitter' do 
    Chitter.create(post: params['post'])
    # post = params['post']
    # connection = PG.connect(dbname: 'chitter_app_test')
    # connection.exec("INSERT INTO chitter (post) VALUES('#{post}')")
    redirect '/chitter'
  end 

  run! if app_file == $0
end
