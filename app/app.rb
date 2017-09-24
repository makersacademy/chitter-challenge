ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
# require_relative "data_mapper_setup"
require_relative "models/peep"

class Chitter < Sinatra::Base


  get "/index" do
    "Hello Chitter!"
    erb :"/index"
  end

  get "/peeps" do
    # This uses DataMapper's .all method to fetch all
    # data pertaining to this class from the database
    @peeps = Peep.all
    erb :"/peeps/index"
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(content: params[:content], title: params[:title])
    redirect '/peeps'
  end

end
