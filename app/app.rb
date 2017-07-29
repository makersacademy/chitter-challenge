ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'app_setup'

class Chitter < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/chits' do
    @chits = Chit.all
    erb(:chits)
  end

  post '/chits' do
    chitbody = params[:chitbody]
    Chit.create(body: chitbody)
    redirect '/chits'
  end

  get '/chits/new' do
    erb(:newchit)
  end

end
