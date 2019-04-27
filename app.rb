require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :front_page
  end

  get '/chitter' do
    erb :'chitter/index'
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  get '/chitter/username' do
    @user_peeps = session[:peeps]
    erb :'chitter/username'
  end

  post '/chitter/username' do
    session[:peeps] = params[:peep]
    redirect '/chitter/username'
  end

  run! if __FILE__ == $0
end