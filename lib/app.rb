require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
# require File.join(File.dirname(__FILE__), '..', './chitter-challenge/database_connection_setup.rb')
# require '/Users/Student/projects/challenges/chitter-challenge/database_connection_setup.rb '
require_relative './database_connection_setup.rb'
require_relative 'peep'
require_relative 'tag'
require_relative 'user'
require_relative 'peep_tag'


class PeepManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Peep Manager'
  end

  get '/peeps' do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(time_stamp: params[:time_stamp], message: params[:message])
    flash[:notice] = "post made"
    redirect '/peeps'
  end

  get '/peeps/:id/tags/new' do
    @peep_id = params[:id]
    erb :'/tags/new'
  end

  post '/peeps/:id/tags' do
    tag = Tag.create(content: params[:tag])
    PeepTag.create(peep_id: params[:id], tag_id: tag.id)
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/peeps')
  end

  run! if app_file == $0
end
