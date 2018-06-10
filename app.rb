require 'pg'
require 'sinatra/base'
require 'sinatra/flash'
require './database_connection_setup'
require './lib/peep_message'
require './lib/sign_up'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    sign_up_error = "The username and or email you entered are already in use"
    flash[:notice] = sign_up_error unless ChitterSignUp.new_user(
      params['name'],
      params['username'],
      params['email'],
      params['password']
    )
    redirect '/users'
  end

  get '/users' do
    redirect '/peeps'
  end

  get '/peeps/post' do
    erb :"peeps/post"
  end

  post '/peeps' do
    PeepMessage.create(
      params['message'],
      params['name'],
      params['username'],
      Time.now
    )
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = PeepMessage.all
    erb :index
  end

  run! if app_file == $0
end
