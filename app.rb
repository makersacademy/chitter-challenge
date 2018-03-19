require 'sinatra/base'
require_relative './lib/chitter_connection_setup'
require_relative './lib/peep'
require_relative './lib/account'

class Chitter < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :login
  end

  get '/login_portal' do
    session["user"] = "Guest"
    redirect '/homepage'
  end

  get '/homepage' do
    @peeps_channel = Peep.channel
    @session = session["user"]
    erb :homepage, :locals => {
      :new_peep_status => false,
    }
  end

  post '/new_peep' do
    @peeps_channel = Peep.channel
    erb :homepage, :locals => {
      :new_peep_status => true
    }
  end

  post '/new_peep_update' do
    @peeps_channel = Peep.channel
    Peep.new_peep(session["user"], params[:peep])
    redirect '/homepage'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup_submit' do
    Account.new_account(params[:name], params[:username], params[:email], params[:password])
    erb :signin, :locals => {
      :invalid_login => false
    }
  end

  get '/signin_portal' do
    erb :signin, :locals => {
      :invalid_login => false
    }
  end

  post '/signin' do
    @peeps_channel = Peep.channel
    @account = Account.load_account(params[:username], params[:password])
    if @account.first
      session["user"] = "#{params[:username]}"
      @session = session["user"]
      erb :homepage, :locals => {
        :new_peep_status => false
      }
    else
      erb :signin, :locals => {
        :invalid_login => true
      }
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
