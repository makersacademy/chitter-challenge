require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'


class Application < Sinatra::Base
  # This refreshes the app code without having to restart the server with each change
  register Sinatra::ActiveRecordExtension
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    return erb(:index)
  end

  get '/signup' do
    return erb(:sign_up)
  end
  
  post '/new-user' do
    
  end

end
