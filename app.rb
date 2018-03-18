require 'sinatra/base'
require_relative './lib/chitter_connection_setup'
require_relative './lib/peep'
require_relative './lib/account'

class Chitter < Sinatra::Base

  get '/' do
    @peeps_channel = Peep.channel
    erb :homepage, :locals => {
      :new_peep_status => false
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
    redirect '/'
  end

  get '/signup' do
    @peeps_channel = Peep.channel
    erb :signup
  end

  post '/signup_submit' do
    @peeps_channel = Peep.channel
    Account.new_account(params[:name], params[:username], params[:email], params[:password])
  end

end
