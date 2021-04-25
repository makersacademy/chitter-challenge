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
    # 'welcome to signup'
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
    # 'welcome to the new peep page'
    erb :new_peep
  end

  post '/new_peep_submitted' do
    Peep.create(content: params[:content], time_stamp: "2021-04-25 22:44:55", user_id: "2")
    redirect('/view_all')
  end
end
