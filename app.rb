require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb :home
  end

  post '/' do
    Peep.add(params['username'],params['name'],params['peep'])
    redirect '/'
  end

  post '/users/new' do
    erb :sign_up
  end

  post '/peeps/user' do
    @name = params['name']
    @username = params['username']
    Peep.add(params['username'],params['name'],params['peep'])
    @peeps = Peep.by(params['username'])
    erb :user_home
  end

  get '/peeps/user' do
    erb :user_home
  end

end
