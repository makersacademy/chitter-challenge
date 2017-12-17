ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require_relative './models/peep.rb'

class Chitter < Sinatra::Base

  get '/' do
   erb(:index)
  end

  get '/new_peep' do
    erb(:new_peep)
  end

  post '/peeps' do
    peep = Peep.create(time: Time.now.strftime("%H:%M %d/%m/%Y"), peep: params[:peep])
    peep.save
    redirect('peeps')
  end

  get '/peeps' do
    @peeps = Peep.all
    erb(:peeps)
  end

  run! if app_file == $0
end
