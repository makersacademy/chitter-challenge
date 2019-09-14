require 'sinatra/base'
require 'rake'
require 'sinatra/activerecord/rake'
require './database_connection_setup.rb'

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

class Chitter < Sinatra::Base
  # include DataMapper::Resource
  # enable :sessions, :method_override
  get '/peep' do
    p @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    erb :index
    'my first peep'
  end
end
