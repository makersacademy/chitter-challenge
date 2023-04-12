# file: app.rb
require 'sinatra'
require_relative '../repo/peep_repository'
require_relative '../repo/user_repository'
#require "sinatra/reloader"
require_relative './database_connection'
require_relative '../models/mailer'

DatabaseConnection.connect

class Application < Sinatra::Base

  configure :development do
    #register Sinatra::Reloader
    #also_reload 'lib/peep'
    #also_reload 'lib/user'
    enable :sessions
  end

  get '/' do
    peeps_repo = PeepRepository.new
    @user_repo = UserRepository.new
    @peeps = peeps_repo.all
    erb(:"app/index")
  end

  post '/new' do
    content = params[:content]
    author = session[:user_id]
    peep = Peep.new
    peep.content = content
    peep.author = author
    peep_repository = PeepRepository.new
    if peep.content.match(/@\w+/)
      puts "we are here"
    end
    peep_repository.create(peep)
    redirect '/'
  end
end