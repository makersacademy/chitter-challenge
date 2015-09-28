module ChitterApp

  module Routes

    class Peeps < Base

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/peeps'
      end

      post '/peeps' do
        peep = Peep.new(username: session[:username],
                        peep: params[:peep],
                        created_at: Time.now)
        peep.user = current_user
        peep.save
        redirect to('/peeps')
      end

      get '/peeps/new' do
        @peeps = Peep.all
        erb :'peeps/new'
      end

      get '/peeps/:id/reply' do
        session[:id] = params[:id]
        erb :'reply/new'
      end

      post '/peeps/:id/reply' do
        peep = Peep.first(id: session[:id])
        reply = Reply.new(username: session[:username],
                          reply: params[:reply],
                          created_at: Time.now)
        reply.peep = peep
        reply.user = current_user
        reply.save
        redirect to('/peeps')
      end

    end

  end

end
