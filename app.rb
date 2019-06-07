require 'sinatra/base'
require './lib/user'
require './lib/peeps'

class Chitter < Sinatra::Base

  get '/register' do
    erb :index
  end

  post '/user_details' do
    @name = params[:name]
    @user_name = params[:user_name]
    @email_address = params[:email_address]
    erb :user_details
  end

  post '/chitter' do
    @peeps = params[:peep]
    @list_peeps = Peeps.all
    erb :chitter
  end

  post '/add_peep' do
    Peeps.create(params[:peep])
    redirect '/chitter'
  end

run! if app_file == $0
end