require 'sinatra/base'
require_relative 'lib/peep.rb'
require_relative 'lib/user.rb'
require 'pg'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chitter' do
    @peeps = Peep.all
    erb :index
  end

  post '/chitter' do
    session[:user] = User.create(user_name: params['name'], user_handle: params['user-handle'], email: params['email'], password: params['password'])
    redirect '/chitter/user'
  end

  get '/chitter/user' do
    @peeps = Peep.all
    @user = session[:user]
    erb :user
  end

  post '/chitter/user' do
    Peep.create(params['content'])
    redirect '/chitter/user'
  end

  run! if app_file == $0

end
