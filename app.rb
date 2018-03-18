require 'sinatra/base'
require_relative './lib/chitter_connection_setup'
require_relative './lib/peep'
require_relative './lib/account'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :login
  end

  get '/login_portal' do
    # Account.guest_login
    redirect '/homepage'
  end

  get '/homepage' do
    @peeps_channel = Peep.channel
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
    Peep.new_peep(params[:name], params[:username], params[:peep])
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
    if Account.load_account(params[:username], params[:password])
      erb :homepage, :locals => {
        :new_peep_status => false
      }
    else
      erb :signin, :locals => {
        :invalid_login => true
      }
    end
  end
end


# post "/monstas" do
#   @name = params["name"]
#   store_name("names.txt", @name)
#   session[:message] = "Successfully stored the name #{@name}."
#   redirect "/monstas?name=#{@name}"
# end
