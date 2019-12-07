require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  post '/peeps' do
    Peep.create(params[:message])
    @peeps = Peep.all
    erb(:peeps)
  end

  get '/peeps/new' do
    erb(:'peeps/new')
  end

  run! if app_file == $0
end
