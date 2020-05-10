require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class Chitter < Sinatra::Base

  # use Rack::Session::Pool

  # shows login / register page
  get '/' do
    erb :user
  end

  # submit new user registration
  post '/register' do
    p $user = User.new(params[:first_name], params[:last_name], params[:email], params[:username], params[:password])
    redirect '/peep'
  end

  # submit login details
  post '/login' do
    #redirects to peeps page if authenication matches
    redirect '/peep' if $user.authenticate(params[:email], params[:password])
    redirect '/login/fail' if $user.authenticate(params[:email], params[:password]) == false
  end

  get '/login/fail' do
    "Sorry, incorrect login details."
    "Go back to the home page"
  end

  # shows all peeps, create/delete peep, log-out
  get '/peep' do
    erb :peep
  end

  # submits new peep
  post '/peep' do
    p $peep = Peep.new(params[:message], $user.username, params[:created_on])
    # redirects to peeps page
    redirect '/peep'
  end

  #deletes peep
  delete '/peep/:id' do
    # redirects to peeps page
    redirect '/peep'
  end

  #user logs out
  post '/logout' do
    redirect '/'
  end

  run! if app_file == $0
end
