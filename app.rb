require 'pg'
require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  get '/create' do
    erb :'create/index'
  end

  post '/peeps' do
    Message.add(peep: params[:peep])
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Message.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
