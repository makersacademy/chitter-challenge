require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'active_support/core_ext/integer/inflections'
require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'data_mapper_setup'
require 'bcrypt'

class Chitter < Sinatra::Base
  
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @error = flash[:login]
    erb :index
  end

  post '/login' do
    user = User.first({username: params[:username]})
    if user
      if user.password == params[:password]
        session[:user_id] = user.id
        redirect '/peeps'
      else
        flash[:login] = 'Error: invalid password'
        redirect '/'
      end
    else
      flash[:login] = 'Error: invalid username'
      redirect '/'
    end
  end

  get '/post' do
    check_login
    erb :post
  end

  get '/peeps' do
    check_login
    @peeps = Peep.reverse
    erb :peeps
  end

  post '/post' do
    check_login
    Peep.create(text: params[:text], created_at: Time.now, user_id: session[:user_id])
    redirect('/peeps')
  end

  def check_login
    unless session[:user_id]
      flash[:login] = 'Error: not logged in'
      redirect('/')
    end
  end
    

  run! if app_file == $0
end