ENV["RACK_ENV"] ||=  "development"
require 'sinatra/base'
require 'sinatra'
#require 'data_mapper_setup'
require_relative 'models/peep'

#class Chitter < Sinatra::Base

enable :sessions

  get '/' do
    erb :index
  end

  get '/log_in' do
    erb :log_in
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/log_in' do
    User.create(email: params[:email], password: params[:password], username: params[:username])
    session['username'] = params[:username]
    redirect '/homepage'
  end

  post '/sign_up' do
    User.create(email: params[:email], password: params[:password], username: params[:username])
    session['username'] = params[:username]
    redirect '/homepage'
  end

  get '/homepage' do
    @peeps = Peep.all
    session['username'] = params[:username]
    erb :homepage
  end

  post '/homepage' do
    Peep.create(name: params[:name])
    redirect '/homepage'
  end

#end
