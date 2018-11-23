require 'sinatra/base'
require_relative './lib/peep.rb'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
    @peep = session[:peep]
    erb(:homepage)
  end

  post '/new' do
    peep = Peep.create(params[:peep_content])
    session[:peep] = peep.peep_text
    redirect '/homepage'
  end

  run! if app_file == $0
end
