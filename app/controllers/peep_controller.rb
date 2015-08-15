module ChitterApp
  module Routes
    class PeepController < Base
      get '/peeps' do
        flash.now[:errors]
        @peeps = Peep.all
        erb :'/peeps/index'
      end

      post '/peeps' do
        if params[:peep] != ''
          peep = Peep.create(text: params[:peep])
          peep.save
          current_user.peeps << peep
          current_user.save
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
