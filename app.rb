require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative 'lib/message'
require_relative 'lib/user'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @user = User.find(id: session[:user_id])
    @messages = Message.all
    erb :index
  end

  get '/write-peep' do
    erb :write_peep
  end

  post '/peeps' do
    Message.create(content: params['content'])
    redirect '/'
  end

  get '/users/sign-up' do
    erb :sign_up
  end

  post '/users' do
    user = User.create(name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    session[:user_id] = user.id
    redirect '/'
  end

  get '/users/sign-in' do
    erb :sign_in
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/users/sign-in')
    end
  end

  run! if app_file == $0

end
