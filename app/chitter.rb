ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/peeps'
require_relative './data_mapper_setup'


class Chitter < Sinatra::Base

  get ('/') do
    @peeps = Peep.all
    erb(:index)
  end

  post('/peeps/new') do
    peep = Peep.create(message: params[:message])
    peep.save
    redirect('/peeps')
  end

  get('/peeps') do
    @peeps = Peep.all
    erb(:messages)
  end



run! if app_file == $0
end
