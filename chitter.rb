require 'sinatra/base'
require 'pg'

require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @message = $message
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    $message = Peep.create(params['message'])
    p $message
    redirect '/peeps'
  end

  run! if app_file == $0
end
