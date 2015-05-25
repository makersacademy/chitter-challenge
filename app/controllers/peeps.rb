module Chitter
  module Routes
    class Peeps < Base

      'You need to be logged in first'

      # Create a peep page
      get '/peeps/new' do
        # Error if logged out
        if !current_user
          flash[:errors] = ['You need to be logged in first']
          redirect '/'
        end
        erb :'/peeps/new'
      end

      # Handle a peep posting request
      post '/peeps' do
        puts 'PEEPS'
        # Error if logged out
        if !current_user
          puts 'PEEPS NOT CURRENT USER'
          flash[:errors] = ['You need to be logged in first']
          redirect '/'
        end
        puts 'PEEPS IS CURRENT USER'
        content = params[:content]
        peep = Peep.create(content: content, time: Time.new)
        current_user.peeps << peep # UH OH
        flash[:notice] = 'Your peep has been posted!'
      end
    end
  end
end
