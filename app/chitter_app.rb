require 'sinatra'
require './lib/user'
require './lib/database_connection'
require './lib/peep'

if ENV['RACK'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end

class Chitter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    User.create(name: params[:name], username: params[:username],
    email: params[:email], password: params[:password])
    redirect '/post_peep'
  end

  get '/post_peep' do
    erb :post_peep
  end

  post '/post_peep' do
    user = User.find(username: params[:username], email: params[:email])
    Peep.create(message: params[:message], user_id: user.id, user_name: user.name)
    redirect '/view_peeps'
  end

  get '/view_peeps' do
    @users = User.all
    erb :all_peeps
  end
end
