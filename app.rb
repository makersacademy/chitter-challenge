require 'sinatra/base'
require './lib/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
    erb :peeps
  end

  get '/peeps' do
    #@peeps = Peeps.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(text: params[:text])
    redirect '/peeps'
  end

  run! if app_file == $0

end
