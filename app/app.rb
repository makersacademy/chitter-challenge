ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative './models/peep'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps/new_peep' do
    Peep.create(text: params[:peep], time: Time.now.asctime)
    redirect '/peeps'
  end

end
