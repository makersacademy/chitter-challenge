require 'sinatra/base'
require 'data_mapper'
require './lib/peep'
require './lib/user'
require 'date'
require 'bcrypt'
require 'warden'

DataMapper.setup(:default, 'postgres://localhost/chitter')
DataMapper.finalize.auto_upgrade!

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [ :id.desc ], :limit => 20)
    @user = User.first(:id => session[:user_id])
    erb(:all_peeps)
  end

  post '/peeps/new' do
    Peep.create(body: params[:body], username: '@tomas', created_at: Time.now)
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:sign_up)
  end

  post '/users' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb(:sign_in)
  end

  post '/sessions' do
    user = User.first(:email => params[:email], :password => params[:password])
    session[:user_id] = user.id
    redirect('/peeps')
  end

  run! if app_file == $0
end
