require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'

DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload "lib/peep_repository"
    also_reload "lib/user_repository"
  end

  get '/' do
    @all_peeps = PeepRespository.new.all_by_rev_date_order_with_author
    return erb(:index)
  end
end