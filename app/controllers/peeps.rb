class Chitter

  post '/peeps' do
    if @user
      Peep.create message: params['message'],
                  user_name: params[:user_name],
                  user_handle: params[:user_handle]
      redirect to '/'
    else
      redirect to '/users/new'
    end
  end

end
