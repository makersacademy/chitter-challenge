ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new_peep' do
    Peep.create(text: params[:peep], time: Time.now.asctime, maker: current_maker)
    redirect '/peeps'
  end

  get '/makers/sign_up' do
    erb :'makers/sign_up'
  end

  post '/makers/new_maker' do
    if params[:password] != params[:confirm_password]
      flash.next[:error] = ['oops.  make sure your password and confirmation passwords match.']
      redirect '/makers/sign_up'
    end
    maker = Maker.create(username: params[:username], email: params[:email], password: params[:password])
    if maker.save
      session[:maker_id] = maker.id
      redirect '/peeps'
    else
      flash.next[:error] = maker.errors.full_messages
      redirect '/makers/sign_up'
    end
  end

  get '/makers/sign_in' do
    erb :'makers/sign_in'
  end

  post '/makers/sign_in' do
    maker = Maker.first(:username => params[:username])
    session[:maker_id] = maker.id
    redirect '/peeps'
  end

  post '/sign_out' do
    session[:maker_id] = nil
    redirect '/peeps'
  end

  get '/peeps/filter/:name' do
    maker = Maker.first(username: params[:name])
    @peeps = maker.peeps
    erb :'peeps/index'
  end

  helpers do

    def current_maker
      Maker.get(session[:maker_id])
    end

  end

end
