require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
require_relative './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/Peeps' do
    ENV['ENVIRONMENT'] = 'test'
    @peeps = Peep.all
    erb :view_peeps
  end

  get '/sign_up' do
    erb :sign_up
  end
  run! if app_file == $PROGRAM_NAME
end
