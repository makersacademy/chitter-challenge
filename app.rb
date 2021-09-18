require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/chitter'

class ChitterChallenge < Sinatra::Base

  set :public, 'public'
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @peeps = Chitter.peeps
    erb(:index)
  end

  post '/' do
    Chitter.post(message: params[:message])
    @peeps = Chitter.peeps
    redirect '/'
  end

  get '/peeps/new' do
    erb(:"peeps/new")
  end

  run! if app_file == $0
end