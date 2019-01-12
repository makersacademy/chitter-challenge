ENV["RACK_ENV"] ||= 'development'

require 'sinatra'
require 'sinatra/activerecord'

set :database_file, "config/database.yml"

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

end