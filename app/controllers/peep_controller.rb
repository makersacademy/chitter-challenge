module Chitter
  module Routes
    class PeepController < Base
      get '/users/:id/peeps' do
        user = User.get(params[:id]) || User.get(session[:user_id])
        @peeps = user.peeps
        erb :'peeps/index'
      end

      get '/users/:id/peeps/new' do
        erb :'peeps/new'
      end

      post '/peeps' do
        peep = Peep.new(content: params[:content], created_at: Time.now)
        peep.user_id = session[:user_id]
        if peep.save
          redirect to "/users/#{peep.user_id}/peeps"
        else
          flash[:notice] = 'Please sign in'
          redirect to '/sessions/new'
        end
      end
    end
  end
end
