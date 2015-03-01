require 'sinatra/base'
require 'data_mapper'


env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'models/peep'

DataMapper.finalize
DataMapper.auto_upgrade!



class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peeps' do
    content = params["content"]
    user = params["user"]
    Peep.create(:content => content, :user => user)
  end


end
