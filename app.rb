require 'sinatra/base'
require 'sinatra/reloader'
require './lib/peep'

class ChitterChallenge < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    redirect('/signup')
  end

  get '/signup' do
    erb :sign_up
  end

  post '/signed_up' do
    # insert new user into chitter_users table
    redirect('/view_all')
  end

  get '/view_all' do
    @all_peeps = Peep.all
    erb :view_all
  end

  get '/new_peep' do
    erb :new_peep
  end

  post '/new_peep_submitted' do
    Peep.create(content: params[:content], time_stamp: "#{Time.now.to_s[0..-7]}", user_id: "2")
    redirect('/view_all')
  end
end
