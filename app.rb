require 'sinatra/base'
require './lib/model.rb'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = ChitterHandler.retrieve_peeps
    erb :chitter_feed
  end

  get '/new-peep' do
    erb :new_peep
  end

  post '/new-peep' do
    ChitterHandler.add_peep(params['peep_message'], params['username'])
    redirect '/'
  end

  get '/new-account' do
    erb :new_account
  end

  post '/new-account' do
    ChitterHandler.create_user(
      username: params['username'],
      email: params['email'],
      name: params['name'],
      password: params['password']
    )
    redirect '/'
  end
end
