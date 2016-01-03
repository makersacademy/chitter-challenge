require 'sinatra/base'
require_relative 'models/peep.rb'
require_relative '../data_mapper_setup.rb'
class Chitter < Sinatra::Base

  get '/' do
     redirect to('/peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(user: params[:user], message: params[:message])
    peep.save
    redirect to('/peeps')
  end

  run! if app_file == $0
end
