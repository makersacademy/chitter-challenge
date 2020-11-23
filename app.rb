require 'sinatra/base'
require './lib/peep'
require './lib/account'

class ChitterChallenge < Sinatra::Base
  enable :sessions 

  get '/' do
    'Welcome to Chitter!'
  end

  get '/signup' do
    erb :'signup'
  end

  post '/peeps/signed_new' do
    account = Account.create(forename: params[:forename], surname: params[:surname], username: params[:username], email: params[:email], password: params[:password])
    session[:username] = account.username
    redirect '/peeps/new'
  end

  get '/peeps' do
    @peeps = Peep.all

    erb :'peeps/index'
  end

  get '/peeps/new' do

    erb :'peeps/new'
  end

  post '/peeps' do
    session[:username] != nil ? username = session[:username] : username = 'Guest'
    Peep.create(script: params[:script], created_at: Time.now, username: username)

    redirect '/peeps'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
