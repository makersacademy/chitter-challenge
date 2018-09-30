require 'sinatra/base'
require 'sinatra'
require_relative './lib/message'

class ChitterManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :homepage
  end

  post '/post_message' do
    Post.create(content: params[:content], created_at: Time.now, user_id: 1)
    redirect '/'
  end

  run! if app_file == $0
end
