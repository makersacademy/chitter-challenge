class Chitter < Sinatra::Base
  post '/replies' do
    if current_user
      peep = Peep.get(params[:peep_id])
      reply = Reply.new(content: params[:content])
      current_user.replies << reply
      peep.replies << reply
      if reply.save
        redirect "/peeps/#{peep.id}"
      else
        flash.now[:errors] = reply.errors.full_messages
        @peeps = [peep]
        erb :'peeps/peep'
      end
    else
      flash.next[:errors] = ['You have to sign in to peep']
      redirect 'sessions/new'
    end
  end
end
