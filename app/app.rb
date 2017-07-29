ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get "/peeps/new" do
    erb :'/peeps/new'
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post "/peeps" do
    Peep.create(content: params[:peep])
    redirect "/peeps"
  end

  run! if app_file == $PROGRAM_NAME
end
