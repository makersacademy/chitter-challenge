module ChitterApp
  module Routes
    class PeepController < Base

      get '/peeps' do
        @peeps = Peep.all
        erb :'peeps/index'
      end

      get '/peeps/new' do
        erb :'peeps/new'
      end

      post '/peeps' do
        peep = Peep.create(post: params[:post],
                           user: session[:user],
                           time: Time.now)
        tags = params[:tags].split(' ')
        tags.each do |tag|
          tag  = Tag.create(name: tag)
          peep.tags << tag
        end
        peep.save
        redirect to('/peeps')
      end

      get '/tags/:name' do
        tag = Tag.first(name: params[:name])
        @peeps = tag ? tag.peeps : []
        erb :'peeps/index'
      end

    end
  end
end
