ENV["RACK_ENV"] ||= "development"
require "sinatra/base"
require_relative "data_mapper_setup"

class Chitter < Sinatra::Base

  get "/peeps/new" do
    erb(:new_peeps)
  end

  get "/peeps" do
    @peeps = Peep.all(order: :created_at.desc)
    erb(:peeps)
  end

  post "/peeps" do
    Peep.create(message: params[:message])
    redirect("/peeps")
  end

  run! if app_file == $0

end
