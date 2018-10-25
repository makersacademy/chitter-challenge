require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/welcome' do
    session[:name] = params[:name]
    @name = session[:name]
    erb :welcome
  end

  get '/post' do
    flash[:post] = "Peep posted"
    erb :post
  end

  run! if app_file == $0

end
