require 'sinatra/base'
require './app/models/comment'

class Chitter < Sinatra::Base

  get '/' do
    @comments = Comment.all
    erb(:home)
  end

  post '/comments' do
    Comment.create(comment: params[:comment])
    redirect '/'
  end
  
  run if app_file == $PROGRAM_NAME
end
