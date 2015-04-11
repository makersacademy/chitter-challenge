class Chitter

  post '/peeps' do
    if @user
      Peep.create message: params['message'],
                  user_name: @user.user_name,
                  user_handle: @user.user_handle
      redirect to '/'
    else
      redirect to '/users/new'
    end
  end

end
