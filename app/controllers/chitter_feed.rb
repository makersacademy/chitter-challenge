class Chitter < Sinatra::Base

    get '/' do
      if current_user
        redirect '/chitter-feed/peeps'
      else
        erb :index
      end
    end

    get '/chitter-feed/peeps' do
      @peeps = Peep.all.reverse
      erb :'chitter_feed/peeps'
    end

    get '/chitter-feed/new' do
      erb :'chitter_feed/new'
    end

    post '/chitter-feed/new' do
      if current_user
        peep = Peep.new(content: params[:message],time_created: Time.now)
        current_user.peeps << peep
        peep.save
        redirect '/chitter-feed/peeps'
      else
        redirect '/session/new'
      end
    end
end
