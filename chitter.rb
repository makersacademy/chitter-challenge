require 'sinatra/base'
current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'TEST_DO_NOT_USE_IN_PRODUCTION'

  get '/' do
    @peeps = Peep.all
    @user = session[:user]
    erb(:index)
  end

  get '/login' do
    @login_error = session[:login_error]
    session[:login_error] = nil
    erb(:login)
  end

  post '/login' do
    user = User.login(params)
    if user.nil?
      session[:login_error] = "Invalid username or password, please try again"
      redirect '/login'
    end

    session[:user] = user
    redirect '/'
  end

  get '/register' do
    erb(:register)
  end

  post '/register' do
    User.create(params)
    redirect '/login', 307
  end

  get '/signout' do
    session[:user] = nil
    redirect '/'
  end

  post '/peeps' do
    @peep = Peep.create(params)
    redirect '/'
  end

  run! if app_file == $0
end
