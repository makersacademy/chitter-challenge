require 'sinatra/base'
require_relative 'models/peep'

class Chitter < Sinatra::Base


  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.new(peep: params[:peep])
    peep.save
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  run! if app_file == $0
end
