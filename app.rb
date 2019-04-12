require 'sinatra/base'
require 'sinatra/flash'
require 'time'

require_relative './lib/peer'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    'Chitter'
  end

  get '/peers' do
    @peers = Peer.all
    erb :"peers/index"
  end

  get "/peers/add" do
    erb :"peers/add"
  end

  post "/peers/add" do
    # flash[:notice] = "You must submit a valid URL." unless
    Peer.create(user_id: 1, content: params[:content])
    redirect("/peers")
  end
end
