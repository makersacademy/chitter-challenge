require 'sinatra/base'
require './lib/peep.rb'
require './lib/user.rb'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find(session[:user_id])
    @peep = Peep.all
    erb :index
  end

  get '/users/new' do
    erb :user_new
  end

  post '/users' do
    @user = User.create(email: params['email'], password: params['password'], name: params['name'], username: params['username'])
    session[:user_id] = @user.id
    redirect '/'
  end

  get '/add-a-new-peep' do
    erb :add_a_new_peep
  end

  post '/add-a-new-peep' do
    time = DateTime.now
    Peep.create(params['message'], time)
    redirect('/')
  end

  run! if app_file == $0
end
