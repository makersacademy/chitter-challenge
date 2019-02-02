require 'sinatra/base'
require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/lib/peeps.rb'

class Chitter < Sinatra::Base


enable :sessions

  get ('/') do
    'Chitter'
  end

  get ('/peeps') do
    @peeps = Peep.all(:order => [ :id.desc ])
  end

  get ('/peeps/new') do
  erb :new
  end

  post ('/peeps') do
  Peep.create(peep params[:peep])
  redirect '/peeps'
  end

  # post('/peeps') do
  #   @peeps.create(text: params[:peep])
  # end


  run! if app_file == $0
end
