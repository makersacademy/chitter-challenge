require './lib/peep.rb'
require './lib/users.rb'
require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get('/') do
    @peeps = Peep.all_peeps
    @user = Users.find(id: session[:user_id])
    erb(:index)
  end

  post('/new-peep') do
    Peep.new_peep(username: session[:current_username],
                  peep: params[:peep])
    redirect('/')
  end

  get('/sign-up') do
    erb(:sign_up)
  end

  post('/sign-up') do
    user = Users.sign_up(username: params[:username],
                  firstname: params[:firstname],
                  secondname: params[:secondname],
                  email: params[:email],
                  password: params[:password])
    session[:user_id] = user.id
    redirect('/')
  end

  get('/sign-in') do
    erb(:sign_in)
  end

  post('/sign-in') do
    user = Users.authenticate(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sign-in'
    end
  end

  get('/sign-out') do
    erb(:sign_out)
  end

  post('/sign-out') do
    session.clear
    redirect('/')
  end
end
