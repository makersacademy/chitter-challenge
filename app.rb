require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/chitter'
require_relative 'lib/user'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get ('/') do
    erb :index
  end

  get ('/peeps') do
    @peeps = Chitter.all
    erb :peeps
  end

  get ('/peeps/new') do
    erb :new
  end

  post ('/peeps') do
    Chitter.create(text: params[:text])
    redirect '/peeps'
  end

  get ('/users/new') do
    erb :users
  end

  post ('/users') do
    User.create(email: params[:email], password: params[:password], username: params[:username] )
    redirect '/peeps'
  end

  run! if app_file == $0
end