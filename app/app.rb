ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get "/peeps/new" do
    erb :'/peeps/new'
  end

  post "/peeps" do
    peep = Peep.create(content: params[:peep],
                      time: Time.new)
    p peep
    redirect to("/peeps")
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  run! if app_file == $PROGRAM_NAME
end
