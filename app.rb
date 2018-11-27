require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require './lib/peep'
require './lib/user'
require 'bcrypt'

  if ENV['RACK_ENV'] == 'test'
    DataMapper.setup(:default, 'postgres://localhost/chitter_test')
  else
    DataMapper.setup(:default, 'postgres://localhost/chitter')
  end

DataMapper.finalize.auto_upgrade!

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all(:order => [ :id.desc ], :limit => 20)
    @user = User.first(:id => session[:user])
    erb(:all_peeps)
  end

  post '/peeps/new' do
    @user = User.first(:id => session[:user])
    Peep.create(body: params[:body],
       username: @user.username,
        created_at: Time.now,
         user_id: @user.id)
    redirect '/peeps'
  end

  get '/users/new' do
    erb(:sign_up)
  end

  post '/users' do
    user = User.create(firstname: params[:firstname],
      lastname: params[:lastname],
       username: params[:username],
        email: params[:email],
         password: params[:password])
    session[:user] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb(:sign_in)
  end

  post '/sessions' do
    user = User.first(:email => params[:email])
    if user == nil
      flash[:notice] = 'Email address not recognised.'
      redirect('/sessions/new')
    elsif BCrypt::Password.new(user.password) == params[:password] && user
      session[:user] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Incorrect password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  run! if app_file == $0
end
