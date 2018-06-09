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
      params['message'],
      params['name'],
      params['username']
    )
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = PeepMessage.all
    erb :index
  end

  run! if app_file == $0
end
