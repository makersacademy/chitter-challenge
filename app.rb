require 'sinatra/base'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/welcome' do
    session[:name] = params[:name]
    @name = session[:name]
    erb :welcome
  end

  run! if app_file == $0

end
