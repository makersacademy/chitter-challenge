require 'sinatra/base'
require 'uri'
require 'pg'
require './lib/peep_message'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Page is working!'
    # This will become the sign in page?
  end

  get '/peeps/post' do
    erb :"peeps/post"
  end

  post '/peeps' do
    PeepMessage.create(
      message: params['message'],
      name: params['name'],
      username: params['username']
    )
    redirect '/peeps'
  end

  get '/peeps' do
    @message = params['message']
    @name = params['name']
    @username = params['username']
    erb :index
  end

  run! if app_file == $0
end
