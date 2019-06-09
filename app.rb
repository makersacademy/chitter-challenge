require 'sinatra/base'
require './lib/username'
require './lib/peep'

class ChitterManager < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up/username' do
    Username.create(params[:username])
    session[:user] = params[:username]
    redirect '/peeps'
  end

  get '/peeps' do
    @user = session[:user]
    @peep = Peep.all
    erb :peeps
  end

  post '/peeps/post' do
    Peep.post(params[:peep_text])
    redirect '/peeps'
  end

end
