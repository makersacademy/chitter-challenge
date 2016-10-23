ENV["RACK_ENV"] ||= "development"

require "sinatra/base"
require_relative "datamapper_setup"

class ChitterApp < Sinatra::Base

  get "/" do
    @peeps = Peep.all
    erb :index
  end

  get "/peeps/new" do
    erb :"peeps/new"
  end

  post "/peeps" do
    @peep = Peep.create(message: params[:message])
    redirect to "/"
  end

  run! if app_file == $0
end
