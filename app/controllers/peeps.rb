module Chitter
  module Routes
    class Peeps < Base

      get '/' do
        redirect('/peeps')
      end

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/index'
      end

      get '/peeps/new' do
        if current_user
          erb :'peeps/new'
        else
          flash[:message] = 'Sign in or sign up to peep!'
          redirect to('/peeps')
        end
      end

      post '/peeps/new' do
        peep = Peep.new(peep: params[:peep],
                        user: current_user,
                        time: Time.now)
        if peep.save
          redirect to('/peeps')
        else
          erb :'peeps/new'
        end
      end

      get '/peeps/:id/replies' do
        session[:id] = params[:id]
        erb :'peeps/replies'
      end

      post '/peeps/:id/replies' do
        peep = Peep.first(id: session[:id])
        peep.replies.create(reply: params[:reply], time: Time.now, user: current_user)
        redirect '/peeps'
      end

    end
  end
end
