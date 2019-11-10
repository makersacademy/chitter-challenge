require 'sinatra/base'
require './lib/peeps.rb'
require './lib/users.rb'
require 'bcrypt'
require './lib/dm_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/user' do
    Users.create(:email => params['email'], :password => BCrypt::Password.create(params['password']), :name => params['name'], :username => params['username'])
    session[:name] = params['name']
    redirect '/user'
  end

  get '/user' do
    @name = session[:name]
    erb :user
  end

  post '/peep' do
    Peeps.create(:peep => params['add_peep'], :created_at => Time.now)
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all(:order => [:created_at.desc])
    erb :peeps
  end

  run! if app_file == $0
end
