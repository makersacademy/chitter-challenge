require 'sinatra/base'
require "sinatra/reloader"

require_relative "./lib/peep_repository"
require_relative "./lib/user_repository"

require 'pg'
require_relative './lib/database_connection'

connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
DatabaseConnection.connect('chitter')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    @top_peeps = []
    repo = PeepRepository.new
    users = UserRepository.new
    result = repo.all
    result.each do |item|
      username = users.find_by_id(item.user_id)
      date = item.time_of_posting.slice!(0,16)
      @top_peeps << [item.content, date, username.username, item.user_id]
    end
    return erb(:index)
  end

  get '/image' do
    send_file 'assets/chitter_logo.png', type: :png
  end

  get '/user_icon' do
    send_file 'assets/user_icon.png', type: :png
  end

  get '/users/:id' do
    user_id = params[:id]
    repo = PeepRepository.new
    users = UserRepository.new
    @peeps = []

    @username = users.find_by_id(user_id).username
    result = repo.find(user_id)
    result.each do |item|
      date = item.time_of_posting.slice!(0,16)
      @peeps << [item.content, date]
    end
    return erb(:peeps)
  end

  post '/post_peep' do
    #
  end
end
