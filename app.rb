require 'sinatra/base'
require 'pg'
require_relative './lib/chitter'
require_relative './lib/user'

class ChitterManager < Sinatra::Base
  enable :sessions

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Chitter.all.reverse
    erb(:chitter)
  end

  post '/peeps' do
    Chitter.add(params[:peep], Time.now)
    redirect('/peeps')
  end

  get '/users' do
    erb(:users)
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect('/peeps')
  end

  run! if app_file == $0
end
