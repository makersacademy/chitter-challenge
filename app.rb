require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "<h1 style='text-align:center'>Welcome to Chitter</h1>"
  end

  get '/peeps' do
    @peeps = Peep.all   
    erb :'/peeps/index'
  end
  
  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(content: params[:content], user_name: params[:user_name])
    # content = params[:content]
    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("INSERT INTO peeps (content) VALUES('#{content}')")
    redirect '/peeps'
  end

  run! if app_file == $0
end