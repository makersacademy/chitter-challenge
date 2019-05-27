require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base
  get '/' do
    "Chitter, a Social Media App for Makers"
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(content: params[:content], time: params[:time])
    redirect '/peeps'
  end

  run if app_file == $0
end
