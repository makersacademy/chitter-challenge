feature 'Peeps' do

  let!(:user) do
    email = 'user@example.com'
    password = 'secret*123'
    User.create(email: email, password: password, password_confirmation: password)
  end

  scenario 'when logged in can post peeps' do
      log_in
      post_peep
    end

end
