require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/chitter'
require_relative './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/addpeep' do
    @name = params[:name]
    @email = params[:email]
    @peep = params[:peep]
    ChitterNew.create(url: params[:url])
    erb :addpeep
  end

  post '/peeps' do
    @peeps = ChitterNew.all
    @peep = params[:peep]
    erb :peeps
  end

  run! if app_file == $0
end