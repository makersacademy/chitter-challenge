require 'sinatra/base'
require './lib/peeps.rb'
require './lib/users.rb'
require 'date'
require 'bcrypt'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
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
    Peeps.create(:peep => params['add_peep'], :created_at => Time.now.strftime("%d/%m/%Y %H:%M"))
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peeps.all(:order => [ :created_at.desc ])
    erb :peeps
  end

  run! if app_file == $0
end
