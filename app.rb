ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './datamapper_setup.rb'
require './lib/models/peep.rb'

class Chitter < Sinatra::Base

  get '/time_line' do
    @peeps = Peep.all
    erb(:time_line)
  end

  post '/addpeep' do
    peep = Peep.create(content: params[:peep])
    peep.save
    redirect '/time_line'
  end

end
