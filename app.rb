require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peeps'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to Chitter!'
  end

  get '/peeps' do
    @peeps = Peeps.all
    erb :peeps
  end

  get '/posting_peeps' do
    erb :posting_peeps
  end

  post '/posting_peeps' do
    Peeps.create(peeps: params[peeps])
    redirect '/peeps'
  end

  run! if app_file == $0
end
