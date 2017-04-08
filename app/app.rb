ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/peep'
require_relative './models/maker'

class Chitter < Sinatra::Base
  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new_peep' do
    Peep.create(text: params[:peep], time: Time.now.asctime)
    redirect '/peeps'
  end

  get '/makers/sign_up' do
    erb :'makers/sign_up'
  end

  post '/makers/new_maker' do
    maker = Maker.create(username: params[:username], email: params[:email], password: params[:password])
    session[:maker_id] = maker.id
    redirect '/peeps'
  end

  get '/makers/sign_in' do
    erb :'makers/sign_in'
  end

  post '/makers/sign_in' do
    maker = Maker.first(:username => params[:username])
    session[:maker_id] = maker.id
    redirect '/peeps'
  end

  helpers do

    def current_maker
      Maker.get(session[:maker_id])
    end

  end

end
