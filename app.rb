require 'sinatra/base'
require './lib/account.rb'
require './lib/peeps.rb'
require './lib/database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @account = Account.all
    @peeps = Peeps.all
    erb(:index)
  end

  post '/add_user' do
    Account.setup(name: params[:name])
    redirect('/')
  end

  post '/create_tweet' do
    Peeps.create(tweet: params[:tweet])
    redirect('/')
  end

  run! if app_file == $0
end
