module ChitterApp
  module Routes
    class PeepController < Base
      get '/peeps/new' do
        erb :'peeps/new'
      end

      post '/peeps' do
        time = Time.new
        peep = Peep.new(content: params[:content],
        creation_time: "Peeped on #{time.day}-#{time.month}-#{time.year}")
        peep.user = current_user
        peep.save
        redirect '/peeps'
      end

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/index'
      end
    end
  end
end
