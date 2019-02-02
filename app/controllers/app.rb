require 'sinatra'
require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/peep'


class Shitter < Sinatra::Base

  # before do
  #   @game = Game.instance
  # end

  configure :development do
    DataMapper.setup :default, "postgres://localhost/shitter"
    DataMapper.finalize
    DataMapper.auto_upgrade!
    set :views, "app/views"
    set :public_dir, "public"
  end

  get '/' do
    "Welcome to Shitter!"
    # reserve for loging in or signing up
  end

  get '/peeps' do
    @peeps = Peep.body
    erb :index
  end

  post '/peeps' do
    Peep.create body: "#{params[:peep_entry]}"
    redirect '/peeps'
  end

end


# require 'sinatra'
# require 'data_mapper'
# require 'dm-postgres-adapter'
# require './lib/peep'
# require './lib/printer'
#
# class Chitter < Sinatra::Base
#
#   configure :development do
#     DataMapper.setup(:default, 'postgres://localhost/chitter')
#     DataMapper.finalize
#     DataMapper.auto_upgrade!
#   end
#
#   get '/peeps' do
#     @peeps = Peep.print_peeps
#     erb :peeps
#   end
#
#   post '/peeps' do
#     Peep.create(content: params[:peep])
#     redirect '/peeps'
#   end
# end
