require 'sinatra/base'
require './lib/user_posts'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/user' do
    @all_posts = User.all
    erb(:user)
  end

  post '/user' do

    User.create_tweet(content: params['new_post'])
    redirect '/user'
  end

  run! if app_file == $0
end
