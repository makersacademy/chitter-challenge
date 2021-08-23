#!/usr/bin/env ruby
require 'sinatra' 
require 'sinatra/reloader'
# require 'peep'
require './lib/db/connect.rb'
require './lib/db/create_tables.rb'
require './lib/user.rb'
require './lib/peep.rb'

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
    session[:signed_in] = false if session[:signed_in].nil?
    @signed_in = session[:signed_in]
    @peeps = Peep.all
    erb :index
  end

  get '/signin' do
    erb :signin
  end

  post '/signin_exec' do
    session[:username] = params[:username].clean_key
    session[:signed_in] = false
    session[:signed_in] = true unless User.get(params[:username].to_sym, params[:password].to_sym).nil?
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
    session[:username] = params[:username].clean_key
    User.add(params).nil? ? (session[:registered_user] = false) : (session[:registered_user] = true)
    session[:signed_in] = true if session[:registered_user] == true
    redirect('/') if session[:registered_user] == true
    redirect('/create?error=Something went wrong')
  end

  get '/peep' do
    erb :peep
  end

  post '/peep_exec' do
    peep = nil
    params[:foreign_key_username] = session[:username].clean_key.to_s if session[:signed_in] == true
    p params[:foreign_key_username]
    peep = Peep.add(params) if session[:signed_in] == true
    redirect('/') unless (session[:signed_in] == false) || peep.nil?
    redirect('/peep?error=You need to Sign in first')
  end

  run! if app_file == $0

end
