require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative './lib/peep'
require_relative './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect('/registrations/sign-up')
  end

  get '/registrations/sign-up' do
    erb :'/registrations/sign_up'
  end

  post '/registrations' do

    User.sign_up(name: params["name"], username: params["username"], 
    email: params["email"], password: params["password"])

    redirect('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    @user = User.all[0] #temporary fix
    erb :'peeps_views/index'
  end

  get '/peeps/new-peep' do
    erb :'/peeps_views/new_peep'
  end

  post '/peeps' do
    user_id = User.all[0].id
    Peep.create_peep(message: params[:message], user_id: user_id)
    redirect('/peeps')
  end

  run! if app_file == $0
end
