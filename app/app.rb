# require 'bcrypt'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/base'
require 'json'
require 'sinatra/flash'
require_relative './models/user'
require_relative './models/peep'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', database: 'chitter_development')

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  enable :sessions, :method_override

  before do
    @user = (User.find_by id: session[:user_id])
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    if !User.unique_username?(params[:username])
      flash[:notice] = "Sorry the username you entered is already taken. Please try another"
      redirect '/users/new'
    elsif !User.unique_email?(params[:email])
      flash[:notice] = "Sorry the email you entered is already taken. Please try another"
      redirect '/users/new'
    else
      user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
      session[:user_id] = user.id
      redirect '/peeps'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    user = User.where({ username: params[:username] }).first
    if user && user.password == params[:password]
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'The username and password you entered did not match our records. Please double-check and try again.'
      redirect '/sessions/new'
    end
  end

  get '/sessions/destroy' do
    session.clear
    redirect '/sessions/new'
  end

  get '/peeps' do
    @peeps = Peep.all.sort_by(&:created_at).reverse! 
    erb :'peeps/index'
  end

  post '/peeps/new' do
    @user.peeps.create(body: params[:body])
    redirect '/peeps'
  end

  get '/peeps/:id/edit' do
    @peep = (Peep.find_by id: params[:id])
    erb :'peeps/edit'
  end

  patch '/peeps/:id' do
    peep = (Peep.find_by id: params[:id])
    peep.update(body: params[:body])
    redirect '/peeps'
  end

  delete '/peeps/:id' do
    peep = (Peep.find_by id: params[:id])
    peep.destroy
    redirect '/peeps'
  end

end
