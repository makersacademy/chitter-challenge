require 'sinatra/base'
require_relative './lib/peep.rb'
require_relative './lib/chitter.rb'
require_relative './lib/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :homepage
  end

  post '/peeplist' do
    Peep.post(params[:peep])
    redirect '/peeplist'
  end

  get '/peeplist' do
    @peeplist = ChitterDB.list
    erb :peeplist
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/add_user' do
    User.create(params['user_name'], params['user_email'], params['user_password'])
    redirect '/welcome'
  end

  get '/welcome' do
    erb :welcome
  end

end
