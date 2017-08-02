require 'sinatra/base'
require 'sinatra/flash'
require_relative '../models/peep'
require_relative '../models/user'
require_relative '../models/tag'
require_relative '../models/reply'

class Chitter < Sinatra::Base

  get '/peeps/reply' do
    @peep = Peep.get(params[:peep_id])
    erb :'/peeps/reply'
  end

  post '/peeps/reply' do
    @peep = Peep.get(params[:peep_id])
    @replys = Reply.create_and_return_replys(
            content: params[:content],
            created_at: Time.now,
            user: current_user,
            peep: @peep)
    redirect '/peeps/peep'
  end

end
