require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
require './lib/peep'
require './lib/printer'
require './lib/user'

class Chitter < Sinatra::Base

  disable :show_exceptions

  configure :development do
    DataMapper.setup(:default, 'postgres://localhost/chitter')
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

  get '/peeps' do
    @peeps = Peep.print_peeps
    erb :peeps
  end

  post '/peeps' do
    Peep.create(content: params[:peep])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :sign_up
  end

  post '/users' do
    User.create(username: params[:username], email: params[:email], password: params[:password], name: params[:name])
    redirect '/peeps'
  end
end
