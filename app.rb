require 'sinatra/base'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter'
  end

  get '/peeps' do
    @peeps = [
            'Hello, working on my Chitter weekend-challenge, first post',
            'Getting, started with my Chitter, and my second post.'
            ]
            
    erb :'peeps/index'
  end

  run! if app_file == $0
end