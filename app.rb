require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
require './lib/peep'
require './lib/printer'
require './lib/user'

class Chitter < Sinatra::Base

  disable :show_exceptions
  enable :sessions

  configure :development do
    DataMapper.setup(:default, 'postgres://localhost/chitter')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

  get '/peeps' do
    @peeps = Peep.print_peeps
    @not_user = User.get(session[:user_id]).nil?
    erb :peeps
  end

  post '/peeps' do
    user_id = session[:user_id]
    peep = Peep.create(content: params[:peep], user_id: user_id)
    redirect '/peeps'
  end

  get '/users/new' do
    erb :sign_up
  end

  post '/users' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password], name: params[:name])
    session[:user_id] = user.id
    redirect '/peeps'
  end
end
