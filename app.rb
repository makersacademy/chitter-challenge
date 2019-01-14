ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './lib/peep'
require_relative './config/datamapper'
require 'pry'
require 'data_mapper'

class Chitter < Sinatra::Base
  set :sessions, true


  get "/profile" do
    @peeps = Peep.all
    erb :index
  end

  post "/peep" do
    peep = Peep.create(:content => params[:peep], :created_at => Time.now)
    redirect ("/profile")
  end



  run! if app_file == $0

end
