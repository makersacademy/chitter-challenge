module ChitterApp
  module Routes
    class PeepController < Base
      get '/peeps' do
        @peeps = Peep.all
        erb :'/peeps/index'
      end

      post '/peeps' do
        peep = Peep.create(text: params[:peep])
        current_user.peeps << peep
        current_user.save
        if peep.save
          redirect '/peeps'
        else
          flash.next[:errors] = ["Cannot be empty"]
          redirect '/peeps/new'
        end
      end

      get '/peeps/new' do
        if session[:user_id].nil?
          flash.next[:notice] = "Sign in first"
          redirect '/'
        end
        flash.now[:errors]
        erb :'/peeps/new'
      end
    end
  end
end
