require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/' do
    "Welcome to Chitter!"
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :'peeps/index'
  end

  get '/peeps/post' do
    erb :'peeps/post'
  end

  post '/peeps' do
    p "Form data submitted here!"
    p params
    # message = params['message']
    # connection = PG.connect(dbname: 'makers_peeps')
    # connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    Peeps.post(message: params['message'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
