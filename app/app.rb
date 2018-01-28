ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/peep'
class Chitter < Sinatra::Base
  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end
  #
  get '/peeps/newpeep' do
    erb :'/peeps/newpeep'
  end

  post '/peeps' do
    Peep.create(message: params[:message], name: params[:name])
    redirect '/peeps'
  end
end
