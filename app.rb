require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post '/users' do
    User.create(params[:email], params[:password])
    session[:email] = params[:email]
    redirect('/peeps')
  end

  post '/users/new' do
    User.create(params[:newemail], params[:newpassword])
    session[:newemail] = params[:newemail]
    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.reverse_view
    @email = session[:email]
    erb :peeps
  end

  post '/peeps/new' do
    Peep.create(params[:peep])
    redirect('/peeps')
  end

end
