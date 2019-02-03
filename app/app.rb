require 'data_mapper'
require 'sinatra/base'

require_relative '../lib/maker.rb'
# putting this one second because DataMapper docs say that belongs_to classes should be run after the class they belong to.
require_relative '../lib/peep.rb'
require_relative '../lib/ORM.rb'


class Chitter < Sinatra::Base

  get '/' do
    peeps = Peep.all
    erb :index, { locals: { peeps: peeps } }
  end

  post '/index' do
    peep = params['new_peep']
    Maker.current_user = Maker.create()
    Maker.current_user.peeps.create(
      :peeptext => peep,
      :timestamp => Time.new
    )
    redirect '/'
  end

end
