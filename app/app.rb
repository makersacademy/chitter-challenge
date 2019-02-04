require 'data_mapper'
require 'sinatra/base'
require 'bcrypt'

require_relative '../lib/maker.rb'
# putting this one second because DataMapper docs say that belongs_to classes should be run after the class they belong to.
require_relative '../lib/peep.rb'
require_relative '../lib/ORM.rb'


class Chitter < Sinatra::Base

  get '/' do
    Maker.all # This line is here so that the example peep in ORM.rb is displayed when you first navigate to homepage
    peeps = Peep.all
    erb :index, { locals: { peeps: peeps } }
  end

  post '/peep/new' do
    peep = params['new_peep']
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
      :password => BCrypt::Password.create(params[:password])
    )
    Maker.current_user = new_maker
    redirect '/'
  end

end
