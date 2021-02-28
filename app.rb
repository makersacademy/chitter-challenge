# frozen_string_literal: true
require './lib/chitter'
require 'sinatra'
require 'pg'
require './lib/user'

  get '/' do
    @list = Chitter.all
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/' do
    username = params[:add_username]
    password = params[:add_password]
    name = params[:add_name]
    email = params[:add_email]
    User.create(username, password, name, email)
    redirect '/signed_in'
  end

  get '/signed_in' do
    @list = Chitter.all
    erb :signed_in
  end

  post '/posting_message' do
    cheet = params[:add_cheet]
    Chitter.post(cheet)
    redirect '/signed_in'
  end
