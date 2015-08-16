module Chitter

  module Routes

    class Peeps < Base

      get '/peeps/new' do
        @reply_to = params[:reply_to]
        unless current_user
          flash[:notice] = 'Please sign up or sign in first!'
          redirect('/')
        end
        erb :'peeps/new'
      end

      post '/peeps' do
        time = Time.new.strftime("%I:%M %p")
        peep = Peep.create(peep: params[:peep], time: time)
        peep.user = current_user
        peep.save
        redirect('/')
      end

    end

  end

end
