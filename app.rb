require 'sinatra/base'
require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/lib/peeps.rb'


class Chitter < Sinatra::Base


enable :sessions

  get ('/') do
    'Chitter'
  end

  get ('/peeps') do
    @peeps = Peeps.all
  end







  run! if app_file == $0
end
