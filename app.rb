require 'sinatra'
require 'sinatra/base'
require './lib/peep'
require './lib/set_up_environ'

class PeepManager < Sinatra::Base

configure do
  enable :sessions
end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.add(params['string'])
    redirect '/peeps'
  end

  run! if app_file == $0
end
