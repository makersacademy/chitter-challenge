require "sinatra/base"
require "sinatra/flash"
require "./lib/databaseconnection_setup"
require "./lib/peep"
require "./lib/user"

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect('/chitter')
  end

  get '/chitter' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb(:index)
  end

  post '/chitter' do
    Peep.create(params[:peep_text])
    redirect("/chitter")
  end

  get '/users/new' do
    erb(:users)
  end

  post '/users' do
    user = User.create(name: params['name'], username: params['username'],
    email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect('/')
  end

  get '/sessions/new' do
    erb(:sessions)
  end

  post '/sessions' do
    user = User.authenticate(params['email'], params['password'])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = "Incorrect email or password"
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You have signed out"
    redirect('/chitter')
  end

end
