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

  post '/peep/new' do
    peep = params['new_peep']
    Maker.current_user = Maker.create()
    Maker.current_user.peeps.create(
      :peeptext => peep,
      :timestamp => Time.new
    )
    redirect '/'
  end

  post '/maker/new' do
    new_maker = Maker.create(
      :displayname => params[:displayname],
      :username => params[:username],
      :email => params[:email],
      :password => params[:password]
    )
    p 'new_maker'
    p new_maker
    Maker.current_user = new_maker
    p 'Maker.current_user'
    p Maker.current_user
    redirect '/'
  end

end
