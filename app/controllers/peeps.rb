module Chitter
  module Routes
    class Peeps < Base

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/content'
      end

      post '/peeps' do
        peep = Peep.create(content: params[:peep], time: Time.new.strftime("%I:%M %p"), user: current_user)
        if peep.save
          redirect('/')
        else
          flash[:notice] = 'Please sign up or login first!'
          redirect('/')
        end
      end

      get '/peeps/new' do
        @reply_to = params[:reply_to]
        erb :'peeps/new'
      end

      get '/peeps/reply' do
        erb :'peeps/reply'
      end

    end
  end
end