require 'sinatra/base'
require_relative './lib/chitter.rb'

class ChitterApp < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/peeps' do
    @peeps = Chitter.all
    erb :peeps
  end

  post '/peeps' do
    Chitter.create(peeps: params[:peeps])
    redirect '/peeps'
  end
  run! if app_file == $0
end
