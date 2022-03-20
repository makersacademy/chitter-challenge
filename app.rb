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
    @messages = Chitter.all
    erb(:peeps)
  end

  get '/peeps/post' do
    erb(:post)
  end

  post '/peeps/post' do
    Chitter.create(
      post: params[:message], 
      timestamp: Time.now.strftime("%H:%M (%d/%m/%Y)")
    )
    redirect '/peeps'
  end

  run! if app_file == $0
end
