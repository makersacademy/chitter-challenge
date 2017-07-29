ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get "/peeps/new" do
    erb :'/peeps/new'
  end

  post "/peeps" do
    Peep.create(content: params[:peep],
                      time: Time.now)
    redirect to("/peeps")
  end

  get "/peeps" do
    @peeps = Peep.all(:order => [ :time.desc ])
    erb :'/peeps/index'
  end

  run! if app_file == $PROGRAM_NAME
end
