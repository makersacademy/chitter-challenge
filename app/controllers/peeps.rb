require 'sinatra/base'
require 'sinatra/flash'
require_relative '../models/peep'
require_relative '../models/user'
require_relative '../models/tag'
require_relative '../models/reply'

class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all_in_reverse_order
    erb :'peeps/index'
  end

  post '/search' do
    flash.next[:notice] = "Search results for " + params[:search].to_s
    peeps = Peep.search(params[:search])
    redirect '/peeps' #{ peeps: peeps, search: params[:search]} }
  end

  post '/peeps' do
    if create_peep(params)
      redirect to('/peeps')
    else
      flash.now[:notice] = "Please enter a message for your peep"
      redirect '/peeps/new'
    end
  end

  get '/peeps/new' do
    if current_user
      erb :'peeps/new'
    else
      flash.now[:notice] = "You must be logged in to post a peep"
      redirect '/peeps'
    end
  end

  delete '/peep' do
    if Peep.get(params[:peep_id]).destroy
      flash.now[:notice] = "Peep deleted."
    else
      flash.now[:notice] = "Peep not deleted."
    end
    redirect '/peeps'
  end

  get '/peeps/:peep_id' do
    @peep = Peep.get(params[:peep_id])
    @replys = Reply.peep_replys_in_reverse(peep_id: @peep.id)
    erb :'/peeps/peep'
  end

end
