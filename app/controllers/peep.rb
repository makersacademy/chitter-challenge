require_relative './base.rb'

module Turing
  module Routes
    class PeepRoute < Base

      get '/peeps/new' do
        erb :'peeps/new'
      end

      post '/peeps' do
        if session[:user_id]
          peep = Peep.create(message: params[:peep], time: Time.now, user_id: current_user.id)
          if peep.save
            redirect '/peeps'
          else
            flash.now[:notice] = 'No message entered'
            erb :'peeps/new'
          end
        else
          flash.now[:notice] = 'You are not signed in'
          erb :'sessions/new'
        end
      end

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/allpeeps'
      end
    end
  end
end