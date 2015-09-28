module ChitterApp
  module Routes
    class ReplyController < Base
      get '/:id/replies/new' do
        session[:peep_id] = params[:id]
        erb :'replies/new'
      end

      post '/replies' do
        peep = Peep.first(id: session[:peep_id])
        time = Time.new
        reply = Reply.new(reply_content: params[:reply_content],
        creation_time: "Replied on #{time.day}-#{time.month}-#{time.year}")
        reply.user = current_user
        reply.peep = peep
        reply.save
        redirect '/replies'
      end

      get '/replies' do
        redirect '/peeps'
      end
    end
  end
end
