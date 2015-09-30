module BeefBurgers
  module Routes
    class Users < Base
      get '/' do
        @peeps = Peep.all
        erb :feed
      end


      get '/password_reset' do
        erb :'/users/password_reset_request'
      end

      post '/password_reset' do
        user = User.first(email: params[:email])
        if user
          user.password_token
          user.save
          flash[:password_reset_sent] = "Check your emails"
          redirect('/')
        else
          flash[:resetting_no_email_on_record] = "No such account on record"
          redirect('/password_reset')
        end
      end

      get '/password_reset/:token' do
        user = User.first(password_token: params[:token])
        @token = params[:token]
        erb :'/users/reset_password'
      end

      post '/password_reset_success' do
        user = User.first(password_token: @token)
        user.password = params[:new_password]
        flash[:password_changed] = "Password succesfully changed"
        redirect('/')   
      end
    end
  end
end