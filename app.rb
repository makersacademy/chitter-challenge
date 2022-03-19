require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    erb(:index)
  end 

  get '/peeps' do
    erb(:peeps)
    # view all of the messages
  end

  post '/peeps/post' do
    # saves params[:message] to database 
    # include Chitter.post(params message)
    connection = PG.connect(dbname: 'chitter')
    message = params['message']
    connection.exec("INSERT INTO chitter_posts (post) VALUES ('#{message}');")
    redirect '/peeps'
  end

  run! if app_file == $0
end
