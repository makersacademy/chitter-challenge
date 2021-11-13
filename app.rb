
require './lib/user'
require './lib/peeps'
require 'pg'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader' if development?
# http://localhost:4567, rackup -p 4567

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @username = User.username
    @username = User.fullname
    @peeps = Peeps.all
    erb(:index)
  end

  run! if app_file == $PROGRAM_NAME
end
