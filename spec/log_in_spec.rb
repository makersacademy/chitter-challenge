feature 'Users' do

  let!(:user) do
    email = 'user@example.com'
    password = 'secret*123'
    User.create(email: email, password: password, password_confirmation: password)
  end

  scenario 'log in and are redirected' do
      log_in
      expect(page).to have_content "Hi #{user.email}"
    end

end
