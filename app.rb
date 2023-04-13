require 'sinatra'
require "sinatra/reloader"
require 'sinatra/activerecord'
require_relative './lib/peep'
require_relative './lib/user'
require_relative 'lib/database_connection'

# Need to edit database_connection later so this would work when deployed
set :database, { adapter: "postgresql", database: "chitter_test" }

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::ActiveRecordExtension
    also_reload 'lib/peep.rb'
    also_reload 'lib/user.rb'
  end

  get '/' do
    @peeps = Peep.all
    return erb(:index)
  end

  get '/new' do
  end

end
