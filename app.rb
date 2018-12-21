require 'sinatra/base'
require 'sinatra/flash'
require './lib/peeps'
require './lib/users'
require './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/chitter'
  end

  get '/chitter' do
    erb :index
  end

  get '/chitter/messaging' do
    erb :"chitter/messaging"
  end

  post '/messaging' do
    Peeps.create(params[:message])
    redirect '/chitter/feed'
  end

  get '/chitter/feed' do
    @peep = Peeps.read
    erb :"chitter/feed"
  end

  post '/chitter/feed' do
    @peep = Peeps.read(params[:sort_by])
    erb :"chitter/feed"
  end

  get '/chitter/sign_up' do
    erb :"chitter/sign_up"
  end

  post '/chitter/sign_up' do
    begin
    Users.create(params[:username], params[:password], params[:email],
                 params[:forename], params[:surname])
    name = params[:forename]
    flash[:success] = "Success, welcome to Chitter #{name}"
    redirect '/chitter/sign_up'
    rescue PG::UniqueViolation
      flash[:username_taken] = "Sorry, that username is already taken. Please try again"
      redirect '/chitter/sign_up'
    end
    erb :"chitter/sign_up"
  end

  run! if app_file == $0
end
