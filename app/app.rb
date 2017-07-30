ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    erb :'index'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

  post '/peeps' do
    Peep.create(:peeps => params[:peeps])
    redirect('/peeps')
  end

  run! if app_file == $0
end
