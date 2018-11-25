require 'sinatra/base'
require 'data_mapper'
require './lib/peep'
require './lib/user'

DataMapper.setup(:default, 'postgres://localhost/chitter')
DataMapper.finalize.auto_upgrade!

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  run! if app_file == $0
end
