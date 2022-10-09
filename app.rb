require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'


class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Chitter Chatter'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end 

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    content = params['content']
    user_id = params['user_id']
    connection = PG.connect(dbname: 'chitter_chatter_test')
    connection.exec("INSERT INTO peeps (content, user_id) VALUES('#{content}') ")
    redirect '/peeps'
  end


  run! if app_file == $0
end

