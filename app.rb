# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/peep'
require_relative 'lib/account'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/account_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/account_repository'
  end

  get '/home' do
    repo = PeepRepository.new
    @peeps = repo.all

    return erb(:home)
  end

  # get '/peeps/new' do
  #   return erb(:new_peep)
  # end

  # post '/peeps' do
  #   repo = PeepRepository.new
  #   content = params[:content]
  #   post_time = params[:post_time]
  #   account_id = params[:account_id]

  #   peep = Peep.new
  #   peep.content = content
  #   peep.post_time = post_time
  #   peep.account_id = account_id

  #   repo.create(peep)
  # end

  # get '/peeps/:id' do
  #   id = params[:id]
  #   repo = PeepRepository.new
  #   account_repository = AccountRepository.new 
  #   @peep = repo.find(params[:id])
  #   @account = account_repository.find(@peep.account_id)
  #   return erb(:account_id)
  # end 
end