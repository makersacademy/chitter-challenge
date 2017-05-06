feature 'Users' do

  let!(:user) do
    email = 'user@example.com'
    password = 'secret*123'
    User.create(email: email, password: password, password_confirmation: password)
  end

  scenario 'log in and are redirected' do
      log_in
    end

end
