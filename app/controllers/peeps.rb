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
        @peep = Peep.first(id: params[:id])
        erb :'reply/new'
      end

      post '/peeps/:id/reply' do
        peep = Peep.first(id: session[:id])
        peep.replies.create(username: session[:username], #could drop this and call it
                          reply: params[:reply],
                          created_at: Time.now,
                          user: current_user)

        redirect to('/peeps')
      end

      delete '/peeps/:id/delete' do
        peep = Peep.first(id: params[:id])
        peep.destroy
        redirect to('/peeps')
      end

    end

  end

end
