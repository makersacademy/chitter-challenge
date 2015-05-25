module Chitter

  module Routes

    class Peeps < Base

      'You need to be logged in first'

      # Create a peep page
      get '/peeps/new' do
        # Error if logged out
        unless current_user
          flash[:errors] = ['You need to be logged in first']
          redirect '/'
        end
        erb :'/peeps/new'
      end

      # Handle a peep posting request
      post '/peeps' do
        # Error if logged out
        unless current_user
          flash[:errors] = ['You need to be logged in first']
          redirect '/'
        end
        content = params[:content]
        peep = current_user.peeps.create(content: content, time: Time.new)
        flash[:notice] = 'Your peep has been posted!'
        redirect '/'
      end

    end

  end

end
