require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/chitter'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get ('/') do
    'Welcome to Chitter'
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

  run! if app_file == $0
end