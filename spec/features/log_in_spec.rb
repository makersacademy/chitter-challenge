feature 'logging in' do
  let!(:user) do Users.create(username: 'Batman', email: 'bruce@wayne.com', password: 'loverobin', password_confirmation: 'loverobin')
  end

  # scenario 'user logs in' do
  #   log_in(username: user.username, password: user.password)
  #   expect(page).to have_content "Welcome, #{user.username}!"
  # end
end