feature 'User can sign in' do

  let!(:user) do
    User.create(username: "Magnus",
                email: "mail@magnusholm.com",
                password: "123banana",
                password_confirmation: "123banana")
  end

  scenario 'with correct creditentials' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content("Logged in as: #{user.username}")
  end

end
