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
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(text: "#{params['new_peep']}")
    @peeps = Peep.all
    @peeps.each do |peep|
      peep.text
    end
    erb :index
  end
end
