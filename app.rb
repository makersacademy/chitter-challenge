require 'sinatra/base'
require './lib/users'
require './lib/messages'
# require './lib/security'


class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/peep' do
    # @peep = session[:peep]
    @peep = Users.all
    @username = Security.username.first
    erb(:peep)
  end

  post '/peep/new' do
    # session[:peep] = params[:enter_chitter]
    Messages.add(params[:enter_chitter])
    redirect '/peep'
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up/new' do
    # session[:username] = params[:username]
    # session[:password] = params[:password]
    Security.sign_up(params[:username], params[:password])
    redirect '/peep'
  end

end
