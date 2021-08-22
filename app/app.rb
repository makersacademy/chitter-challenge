#!/usr/bin/env ruby
require 'sinatra' 
require 'sinatra/reloader'
# require 'peep'
require './lib/db/connect.rb'
require './lib/db/create_tables.rb'

class Chitter < Sinatra::Base
  attr_reader :db_connection
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  
  configure :test, :development do
    @db_connection = Connect.initiate(:chitter)
    CreateTables.if_not_exists(@db_connection)
  end

  get '/' do 
    session[:signed_in] = true if session[:signed_in].nil?
    @signed_in = session[:signed_in]
    erb :index
  end

  get '/signin' do
    erb :signin
  end

  post '/signin_exec' do
    session[:signed_in] = false

    redirect('/') if session[:signed_in] == true
    redirect('/signin?error=User and password do not match')
  end

  get '/signout' do
    session[:signed_in] = false
    redirect('/')
  end

  get '/create' do
    erb :create
  end

  post '/create_exec' do
    session[:registered_user] = false

    session[:signed_in] = true if session[:registered_user] == true
    redirect('/') if session[:registered_user] == true
    redirect('/create?error=Something went wrong')
  end

  get '/peep' do
    erb :peep
  end

  post '/peep_exec' do
    
    redirect('/') if session[:signed_in] == true
    redirect('/peep?error=You need to Sign in first')
  end

  run! if app_file == $0

end
