require 'sinatra/base'
require 'bcrypt'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/signup'
  end

  get '/signup' do
    erb :signup_page
  end

  post '/signup' do
    #redir get signup if validation = false
    user = User.create(username: params[:username] , password: params[:password], email: params[:email])
    redirect '/peeps'
  end

end
