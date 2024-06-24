require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Chitter challenge"
    # redirect :signup
  end

  get '/view_peeps' do
    @peeps = Peep.all
    erb :view_peeps
  end

  post '/post_peep' do
    Peep.save(message: params[:message]) #time: params[Time.now.strftime('%H:%M:%S')
    p params
    redirect '/view_peeps'
  end

  run! if app_file == $0
end