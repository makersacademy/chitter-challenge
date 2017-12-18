ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require_relative './models/peep.rb'
require_relative './models/user.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
   erb(:signup)
  end

  post '/peep_home' do

    user = User.create(username: params[:username],
       email_address: params[:email_address],
       password: params[:password],
       password_confirmation: params[:password_confirmation])
    session[:username] = user.username
    redirect'/peep_home'
  end

  get '/peep_home' do
    @username = session[:username]
    erb(:index)
  end

  get '/new_peep' do
    erb(:new_peep)
  end

  post '/peeps' do
    peep = Peep.create(time: Time.now.strftime("%H:%M %d/%m/%Y"), peep: params[:peep], author: session[:username])
    peep.save
    redirect('peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  run! if app_file == $0
end
