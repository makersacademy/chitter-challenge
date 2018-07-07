require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/user'


class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    User.create(params[:name],params[:username],params[:email],params[:password])
    flash[:welcome]="Welcome to Chitter #{params[:name]}"
    redirect '/'
  end

  run! if app_file == $0

end
