require 'sinatra/base'
require 'sinatra/flash'
require 'pry'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :public_folder, 'public'
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/session/new' do
    erb :'session/new'
  end

  post '/session/new' do
    session[:name] = params[:name]
    redirect '/'
  end

  helpers do
    def active_page?(path='/')
      request.path_info == path
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
