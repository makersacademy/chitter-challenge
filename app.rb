require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'
require './lib/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    @peeps = Peep.all.reverse
    erb :home
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/user/sign-up' do
    erb :sign_up
  end
  post '/user/sign-in' do
    erb :sign_in
  end

  post '/peeps' do
    Peep.create(params)
    redirect '/'
  end
  post '/peeps/user'do
  p params
    @username = params['username']
    @peeps = Peep.peeps_user(params['username'])
    erb :user_homepage


  end
  post '/peeps' do
    redirect '/sign-in'
  end



  run! if app_file == $0
end
