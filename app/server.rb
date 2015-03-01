require 'data_mapper'
require 'sinatra'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_challenge_#{env}")

require_relative 'models/peep'

DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do 
  @peeps = Peep.all
  erb :index
  end

  post '/peeps' do
  text = params["text"]
  Peep.create(:text => text)
  redirect to('/')
end
