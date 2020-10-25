require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/chitter_account.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :sign_up
  end
  
  post '/:parameters' do
    session[:name] = params[:name]
    session[:username] = params[:username]
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect('/welcome')
  end

  get '/welcome' do
    @name = session[:name]
    account = ChitterAccount.create(name: session[:name], username: session[:username], email: session[:email], password: session[:password])
    if account == nil
      redirect('/failed_signup')
    else
      erb :welcome
    end
    # currently sends you to /chitter_feed?
  end

  get '/failed_signup' do
    erb :failed_signup
  end

  get '/chitter_feed' do
    @peeps = Peep.all
    erb :chitter_feed
    # pass information from database to views - name, username, time, peep
  end

  get '/chitter_feed/new_peep' do
    erb :new_peep
  end

  post '/chitter_feed/posted_peep' do
    time = Time.now.strftime("%H:%M:%S")
    Peep.create(peep: params[:peep_text], time: time)
    redirect('/chitter_feed')
    # peep needs username, name, time posted
  end
end