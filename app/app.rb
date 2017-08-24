require 'sinatra/base'
require 'database_cleaner'

class Chitter < Sinatra::Base

  get '/' do
    'Chitting'
  end
end
