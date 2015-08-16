module TheApp
  module Routes
    class PeepController < Base
      get '/peeps' do
        @peeps = Peep.all
        erb :'/peeps/index'
      end

      post '/peeps' do
        t = Time.new
        peep = Peep.new(content: params[:message],
                        time_created: "Written on #{t.day}-#{t.month}-#{t.year} at #{t.hour}: #{t  .min}")
        peep.user = current_user
        peep.save
        redirect to('/peeps')
      end

      get '/peeps/new' do
        erb :'/peeps/new'
      end
    end
  end
end
