require 'sinatra/base'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/post' do
    @user = User.instance
    erb(:post)
  end

  post '/peeps' do
    @user = User.instance 
    Peep.create(params[:message], @user.id)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  post '/signup' do
    User.create(params[:name], params[:user_name], 
      params[:email], params[:password])
    redirect '/post'
  end

end
