require 'sinatra/base'

class CHITTER < Sinatra::Base

  get '/' do
    redirect '/posts'
  end

  get '/posts' do
    erb :'/posts/index'
  end

  post '/posts' do
    redirect '/posts'
  end

  get '/posts/new' do
    erb :'/posts/new'
  end

  get '/stylesheets/style.css' do
    scss :style
  end

  run! if app_file == $PROGRAM_NAME
end
