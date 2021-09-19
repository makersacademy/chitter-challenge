require 'sinatra/base'
require 'sinatra/reloader'
require './lib/chitter'
require './lib/account'

class ChitterManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @logged_in = params['logged_in']
    email = params['email']
    @all_peeps = Chitter.all
    erb :index
  end

  post '/peep_added' do
    peep = params['peep']
    Chitter.add(peep)
    redirect '/'
  end

  post '/registration' do
    erb :registration
  end

  post '/registration_added' do
    email = params['email']
    password = params['password']
    Account.register(email, password)
    redirect '/'
  end

  post '/log_in' do
    erb :log_in
  end

  post '/logged_in' do
    email = params['email']
    password = params['password']
    Account.login(email, password)
    redirect '/'
  end

  run! if app_file == $0
end
