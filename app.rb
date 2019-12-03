require 'sinatra/base'

require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base

    get '/' do
      @peeps = Peep.all
      erb :'index'
    end

    post '/peeps' do
      Peep.create(params[:peep])
      redirect '/'
    end

    post '/sign-up' do
      erb :'sign_up'
    end

    post '/sign-up-check' do
      @user_handles = User.all_handles
      @user_emails = User.all_emails
      if @user_handles.include?(params[:author_handle])
        erb :'sign_up_fail_author_handle'
      elsif @user_emails.include?(params[:email])
        erb :'sign_up_fail_email'
      else
        @new_user = User.create(params[:author_name], params[:author_handle], params[:email], params[:password])
        erb :'sign_up_complete'
      end
    end

    #post '/sign-in' do
      #find the entry in the database and set variables based on that
    #end

    run! if app_file == $0

end
