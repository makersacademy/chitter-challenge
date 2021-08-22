require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :message
  end
  
  get '/peeps/new' do
    erb :index
  end
  
  # get '/newpeep' do
  #   erb :message
  # end

  post '/peeps' do
    Peeps.create(message: params[:message])
    # message = params['message']
    # conn = PG.connect(dbname: 'chitter_test')
    # conn.exec("INSERT INTO chitter (message) VALUES('#{message}')")
   redirect '/peeps'
  end

  

 # start the server if ruby file executed directly
 run! if app_file == $0
end