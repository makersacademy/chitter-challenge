require 'sinatra'
require 'sinatra/reloader'

class Chitter < Sinatra::Base
  configure :test do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    @message = session[:message]
    erb(:index)
  end

  post '/new_post' do
    session[:message] = params[:message]
    redirect '/'
  end

  run! if app_file == $0

end
