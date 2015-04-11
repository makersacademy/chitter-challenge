class Chitter

  post '/peeps' do
    if current_user
      Peep.create message: params['message'],
                  user_name: current_user.user_name,
                  user_handle: current_user.user_handle
      redirect to '/'
    else
      redirect to '/users/new'
    end
  end

end
