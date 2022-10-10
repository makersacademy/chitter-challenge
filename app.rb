require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/peep_manager'
require_relative 'lib/maker_manager'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_manager'
    also_reload 'lib/maker_manager'
  end

  before do
    @peep_manager = PeepManager.instance
    @maker_manager = MakerManager.instance
  end

  get '/feed' do
    @peeps = @peep_manager.all_peeps
    # default view, no login needed but new peep form still shows
    return erb(:feed)
  end

  post '/feed' do
    # logged in, viewing list + new peep form
    new_peep = Peep.new
    new_peep.timestamp = Time.now.getutc
    new_peep.content = params[:content]
    new_peep.maker_id = @peep_manager.last.maker_id # EXTREME PLACEHOLDER DO NOT SHIP

    @peep_manager.create(new_peep)

    return redirect('/feed')
  end

  get '/new_maker' do
    return erb(:new_maker)
  end

  post '/new_maker' do
    new_maker = Maker.new
    new_maker.email = params[:email]
    new_maker.name = params[:name]
    new_maker.username = params[:username]
    new_maker.password = params[:password]

    @maker_manager.create(new_maker)

    return redirect('/feed')
  end
# ------login/out functionality-----

  # get '/login' do
  #   return erb(:login)
  # end

  # post '/login' do
  #   ????
  #   return redirect('/feed')
  # end
end
