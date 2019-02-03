require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/peeps'
require_relative '../spec/test_database'
require_relative '../lib/database_setup'
require_relative '../lib/comment'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/register_new' do
     erb(:register)
  end

  get '/guest' do
    @user = User.list.find{ | user | user.id == session[:user_id] }
    @peeps = Peeps.list.reverse
    @users = User.list
    @comment_list = Comment.list
    erb(:guest_view)
  end

  post '/create/account' do
    redirect '/register_new'
  end

  post '/register' do
    user = User.add(username: params[:username], password: params[:password], email: params[:email], name: params[:name])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:warning] = "Email or name already in use - try again."
      redirect '/register_new'
    end
  end

  post '/session' do
    user = User.login(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = "Invaild username or password given - try again."
      redirect '/'
    end
  end

  get '/peeps' do
    @user = User.list.find{ | user | user.id == session[:user_id] }
    @peeps = Peeps.list.reverse
    @users = User.list
    @comment_list = Comment.list
    erb(:peeps)
  end

  post '/add_peep' do
    @user = User.list.find{ | user | user.id == session[:user_id] }
    Peeps.add(peep: params[:peep], user_id: @user.id)
    redirect '/peeps'
  end

  get '/add_comment' do
    @peep = Peeps.list.find { | peep | peep.id == params[:id] }
    @user = User.list.find{ | user | user.id == session[:user_id] }
    erb(:add_comment)
  end

  post '/add_comment' do
    Comment.add(text: params[:comment], peep_id: params[:peep_id], user_id: params[:user_id])
    redirect '/peeps'
  end

  post '/logout' do
    session.clear
    redirect '/'
  end

  run! if app_file == $0
end
