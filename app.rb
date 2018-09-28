# require 'sinatra'
require 'sinatra/base'
require './lib/chitter'

class ChitterApp < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/list_msgs' do
    @msg = Chitter.all
    erb :list_msgs
  end

  get '/enter_msg' do
    # session[:message] = params[:message]
    # @msg = session[:message]
    erb :enter_msg
  end

  post '/enter_msg' do
    message = params['message']
    conn = PG.connect(dbname: 'chitter')
    conn.exec("INSERT INTO chits(message) VALUES('#{message}')")
    redirect 'list_msgs'
  end

  # start the server if ruby file executed diectly
  run! if app_file == $0

end
