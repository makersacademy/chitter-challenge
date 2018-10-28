require 'sinatra/base'
require './lib/user'
require './lib/peep'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    if session[:username]
      @user = User.find(column: 'username', value: session[:username])
    end
    @peeps = Peep.all
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    name = params[:name]
    username = params[:username]
    emailaddress = params[:emailaddress]
    password = params[:password]
    if User.unique_check(username, emailaddress)
      session[:unique_check] = true
      User.create(name: name, username: username,
         emailaddress: emailaddress, password: password)
      session[:name] = name
      session[:username] = username
      redirect "/#{username}"
    else
      session[:unique_check] = false
      flash[:notice] = "Username/Password already taken"
      redirect '/sign_up'
    end
  end

  get '/log_in' do
    erb :log_in
  end

  post '/log_in' do
    username = params[:username]
    password = params[:password]
    if User.password_authentication(username, password)
      session[:password_authentication] = true
      # session[:name] = name
      # session[:username] = username
      redirect "/#{username}"
    else
      session[:password_authentication] = false
      flash[:notice] = "Password incorrect, try again!"
      redirect '/log_in'
    end
  end

  get '/:username' do
    @name = User.name
    @username = params[:username]
    erb :profile
  end

  get '/peep/new' do
    @name = params[:name]
    @username = params[:username]
    erb :'peep/new'
  end

  post '/peep/new' do
    name = session[:name]
    username = session[:username]
    user = User.find(column: username, value: "#{username}")
    post = params[:post]
    Peep.post(name: params[:name], username: params[:username], post: params[:post], time: Time.now)
    redirect '/'
  end

    run! if app_file == $0
end
