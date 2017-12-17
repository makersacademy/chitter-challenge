ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/peeps'
require_relative './data_mapper_setup'


# require 'database_cleaner'
#
# DatabaseCleaner.strategy = :truncation
# DatabaseCleaner.clean


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
    @peeps = Peep.all.reverse
    erb(:messages)
  end



run! if app_file == $0
end
