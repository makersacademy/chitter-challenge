require './lib/peep.rb'
require './lib/users.rb'
require 'sinatra/base'
require './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions
  get('/') do
    @peeps = Peep.all_peeps
    @username = session[:current_username]
    erb(:index)
  end

  post('/new-peep') do
    Peep.new_peep(user_id: params[:id], peep: params[:peep])
    redirect('/')
  end

  get('/sign-up') do
    erb(:sign_up)
  end

  post('/sign-up') do
    session[:current_username] = params[:username]
    Users.sign_up(username: params[:username],
                  firstname: params[:firstname],
                  secondname: params[:secondname],
                  email: params[:email])
    redirect('/')
  end
end
