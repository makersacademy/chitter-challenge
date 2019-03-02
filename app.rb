require 'sinatra/base'
require 'sinatra/flash'
require './connect_to_database'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    '<a href="/peeps">See the peeps</a>'
  end

  get '/peeps' do
    @peeps = Peep.all
    # user = session[:user]
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(text: params['text'])
    redirect '/peeps'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  get '/accounts/new' do
    erb :'accounts/new'
  end

  post '/accounts/create' do
    if User.create(email: params['email'], name: params['name'], username: params['username'], password: params['password']).nil?
      flash[:error] = 'Unable to create account'
    else
      # sign user in
      redirect '/peeps'
    end
  end

  get '/accounts/login' do
    erb :'accounts/login'
  end
  
  post '/accounts/login' do
    session[:user] = User.login(email: params['email'], password: params['password'])
    redirect '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
