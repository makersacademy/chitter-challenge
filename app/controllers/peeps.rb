module Chitter
  module Routes
    class Peeps < Base

      # Create a peep page
      get '/peeps/new' do
        erb :'/peeps/new'
      end

      # Handle a peep posting request
      post '/peeps' do
        content = params[:content]
        peep = Peep.create(content: content, time: Time.new)
        puts current_user
        current_user.peeps << peep # UH OH
        flash[:notice] = 'Your peep has been posted!'
      end
    end
  end
end
