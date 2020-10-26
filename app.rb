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
  
  post '/signingup' do
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
      session[:signupfail] = false
      redirect('/signup')
    else
      erb :welcome
    end
    # currently sends you to /chitter_feed?
  end

  get '/login' do
    erb :login
  end

  post '/logingin' do
    # are the user name and password correct?
    session[:username1] = params[:username1]
    session[:password1] = params[:password1]
    if ChitterAccount.identity_check(session[:username1], session[:password1])
      redirect('/chitter_feed')
    else
      session[:loginfail] = false
      redirect('/login')
    end
  end

  get '/chitter_feed' do
    @peeps = Peep.all
    erb :chitter_feed
  end

  get '/chitter_feed/new_peep' do
    session[:username1] == nil ? redirect('/login') : erb(:new_peep)
  end

  post '/chitter_feed/posted_peep' do
    time = Time.now.strftime("%H:%M:%S")
    name = ChitterAccount.retrieve_name(session[:username])
    Peep.create(peep: params[:peep_text], time: time, name: name, username: session[:username1])
    redirect('/chitter_feed')
  end
end