require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'bcrypt'
require_relative 'lib/cheep'
require_relative 'lib/user'

class Chitter < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    @cheeps = Cheep.order("created_at DESC")
    @corresponding_users = @cheeps.map do |cheep|
      User.find(cheep.user_id)
    end
    erb(:homepage)
  end
end
