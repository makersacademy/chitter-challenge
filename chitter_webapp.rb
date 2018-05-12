require 'data_mapper'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
load './datamapper_setup.rb'


class ChitterApp < Sinatra::Base

  configure do
    enable :sessions
  end

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    redirect '/sessions/new' unless session[:current_user]
    @peeps = Peep.all.sort_by { |peep| peep.created_at }.reverse
    erb :peeps
  end

  post '/peeps/new' do
    peep = Peep.new(text: params[:peep])
    peep.save
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :login
  end

  run! if __FILE__ == $0
end
