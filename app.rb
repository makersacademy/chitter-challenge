require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello world'
  end

  get '/peeps/post' do
    erb :posting
  end

  post '/peeps/post' do
    session[:message] = params[:message]
    redirect '/peeps'
  end

  get '/peeps' do
    session[:message]
  end

  run if app_file == $0
end
