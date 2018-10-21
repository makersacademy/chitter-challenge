require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/post' do
    @user = session[:user]
    erb(:post)
  end

  post '/peeps' do
    @user = session[:user]
    Peep.create(params[:message], @user.id)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  post '/signup' do
    session[:user] = User.create(params[:name], params[:user_name],
      params[:email], params[:password])
    redirect '/post'
  end

end
