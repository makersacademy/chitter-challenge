# require 'sinatra'
require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/user_name' do
    session[:name] = params[:name]
    @name = session[:name]
    redirect 'list_msgs'
  end

  get '/list_msgs' do
    @msg = Chitter.all
    erb :list_msgs
  end

  get '/enter_msg' do
    erb :enter_msg
  end

  post '/enter_msg' do
    message = params['message']
    @name = session[:name]
    conn = PG.connect(dbname: 'chitter')
    conn.exec("INSERT INTO chits(name, message) VALUES('#{@name}', '#{message}')")
    redirect 'list_msgs'
  end

  # start the server if ruby file executed diectly
  run! if app_file == $0

end
