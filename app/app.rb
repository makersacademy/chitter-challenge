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
    if params[:password] != params[:confirm_password] || params[:password] == ''
      flash.next[:error] = 'oops.  make sure you entered a valid password and matching confirmation.'
      redirect '/makers/sign_up'
    end
    maker = Maker.create(username: params[:username], email: params[:email], password: params[:password])
    if maker.save
      session[:maker_id] = maker.id
      redirect '/peeps'
    else
      flash.next[:error] = maker.errors.full_messages[-1]
      redirect '/makers/sign_up'
    end
  end

  get '/sessions/sign_in' do
    erb :'sessions/sign_in'
  end

  post '/sessions/sign_in' do
    if Maker.authentic?(params[:username], params[:password])
      maker = Maker.first(:username => params[:username])
      session[:maker_id] = maker.id
      redirect '/peeps'
    else
      flash.next[:error] = 'wrong username or password'
      redirect '/sessions/sign_in'
    end
  end

  post '/sessions/sign_out' do
    session[:maker_id] = nil
    redirect '/peeps'
  end

  get '/makers/profile/:name' do
    @maker = Maker.first(username: params[:name])
    @peeps = @maker.peeps
    erb :'makers/profile'
  end

  get '/peeps/comments/:id' do
    @peep = Peep.get(params[:id])
    erb :'peeps/comments'
  end

  post '/peeps/new_comment/:id' do
    peep = Peep.get(params[:id])
    Comment.create(text: params[:words], time: Time.now, peep: peep, maker: current_maker)
    redirect "/peeps/comments/#{params[:id]}"
  end

  helpers do

    def current_maker
      Maker.get(session[:maker_id])
    end

  end

end
