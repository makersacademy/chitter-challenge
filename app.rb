require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require_relative './lib/chitter'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do 
    erb(:index)
  end 

  get '/peeps' do
    @messages =  Chitter.all
    # connection = PG.connect(dbname: 'chitter')
    # result = connection.exec("SELECT post FROM chitter_posts")
    # @messages = result.map do |row| 
    #   row['post']
    # end
    erb(:peeps)
  #   # view all of the messages

  end

  get '/peeps/post' do
    erb(:post)
  end

  post '/peeps/post' do
    Chitter.create(post: params[:message])
    # message = params['message']
    # connection = PG.connect(dbname: 'chitter')
    # connection.exec("INSERT INTO chitter_posts (post) VALUES ('#{message}');")
    redirect '/peeps'
  end

  run! if app_file == $0
end
