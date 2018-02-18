require "sinatra/base"
require "./lib/databaseconnection_setup"
require "./lib/peep"
require "./lib/user"

class Chitter < Sinatra::Base

  enable :sessions

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

end
