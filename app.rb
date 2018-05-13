require 'sinatra/base'
require 'sinatra/flash'

require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  configure do
    use Rack::MethodOverride
  end

  before do
    @current_user = session['user']
  end

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Peep.all
    @user_class = User

    erb(:peeps)
  end

  get '/users/:id/peeps/new' do
    erb(:peeps_new)
  end

  post '/users/:id/peeps' do
    Peep.create(params['peep'], params['id'])

    redirect('/peeps')
  end

  get '/users/new' do
    erb(:users_new)
  end

  post '/users' do
    User.create(params['email'], params['password'], params['name'], params['username'])

    redirect('/')
  end

  post '/sessions' do
    username = params['username']
    password = params['password']
    if User.exists?(username) && User.correct_password?(username, password)
      session[:user] = User.select_by_username(username)

      redirect('/peeps')
    elsif User.exists?(username) && !User.correct_password?(username, password)
      flash[:incorrect_password] = 'Incorrect password'

      redirect('/')
    else
      flash[:incorrect_username] = 'Incorrect username'

      redirect('/')
    end
  end

  delete '/sessions' do
    session['user'] = nil

    redirect('/')
  end

  run! if app_file == $0
end
