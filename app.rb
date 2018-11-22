require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peep = session[:peep]['description']
    erb(:peeps)
  end

  post '/peeps/new' do
    session[:peep] = Peep.create(description: params[:peep]).first
    redirect '/peeps'
  end

end
