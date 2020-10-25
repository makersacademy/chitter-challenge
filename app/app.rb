require 'sinatra/base'
require_relative 'models/peep.rb'
require_relative 'models/user.rb'
require_relative '../database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do 
    @sorted_peeps = Peep.all.sort_by { |peep| peep.posted_on }.reverse
    erb(:index)
  end

  get '/registrations/new' do
    erb(:'registrations/new')
  end

  post '/registrations' do
    user = User.create(username: params[:username], email: params[:email], name: params[:name], password: params[:password])
    if user
      session[:user_id] = user.id
      session[:signup_fail] = false
      redirect('/')
    else
      session[:signup_fail] = true
      redirect('/registrations/new')
    end
  end

  get '/login' do
    erb(:'sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      session[:login_fail] = false
      redirect('/')
    else
      session[:login_fail] = true
      redirect('/login')
    end
  end

  delete '/sessions' do
    session.delete(:user_id)
    redirect('/')
  end
 
  get '/peeps' do
    erb(:'peeps/add')
  end

  post '/peeps' do
    Peep.create(username: params[:username], body: params[:body])
    redirect('/')
  end

  delete '/peeps' do
    Peep.delete(id: params[:peep_id])
    redirect('/')
  end

  get '/peeps/:id/edit' do
    @peep = Peep.find_by(id: params[:peep_id])
    erb(:'peeps/edit')
  end

  put '/peeps' do
    Peep.update(id: params[:peep_id], body: params[:body])
    redirect('/')
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  run! if app_file == $0
end
