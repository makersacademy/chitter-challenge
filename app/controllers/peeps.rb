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
        time = Time.new.strftime("%I:%M %P %d-%m-%Y")
        peep = Peep.create(peep: params[:peep], user: current_user, time: time)
        if peep.save
          redirect('/')
        else
          flash.now[:errors] = peep.errors.full_messages
          erb :'peeps/new'
        end
      end

    end

  end

end
