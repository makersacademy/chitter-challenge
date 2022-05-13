require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep.rb'
require_relative './lib/user.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/account_created' do
    @username = params[:username]
    erb :account_created
  end

  post '/send_peep' do
    erb :send_peep
  end

  post '/show_peeps' do
    Peep.create(params[:peep_content])
    @peeps_sorted = Peep.all.sort_by {|obj| obj.time_posted}.reverse!
    erb :show_peeps
  end

  run! if app_file == $0
end