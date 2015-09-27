module Chitter
  module Routes
    class Peeps < Base

      get '/' do
        redirect('/peeps')
      end

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/index'
      end

      get '/peeps/new' do
        erb :'peeps/new'
      end

      post '/peeps/new' do
        peep = Peep.create(peep: params[:peep], user: current_user)
        if peep.save
          redirect to('/peeps')
        end
        # peep = Peep.new(peep: params[:peep])
        # peeps_array = params[:tag].split(' ')
        #   peeps_array.each do |post|
        #     newpeep = Peep.create(name: tag)
        #     peep.posts << newpeep
        #   end
        # peep.save
        # redirect('/peeps')
      end

    end
  end
end
