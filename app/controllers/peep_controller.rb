module ChitterApp
  module Routes
    class PeepController < Base
      get '/peeps' do
        @peeps = Peep.all
        erb :'/peeps/index'
      end

      post '/peeps' do
        peep = Peep.create(text: params[:peep])
        if peep.save
          current_user.peeps << peep
          current_user.save
          peep.user << current_user
          peep.save
          redirect '/peeps'
        else
          flash.now[:errors] = current_user.errors.full_messages
      end

      get '/peeps/new' do
        if session[:user_id].nil?
          flash.next[:notice] = "Sign in first"
          redirect '/'
        end
        erb :'/peeps/new'
      end
    end
  end
end
