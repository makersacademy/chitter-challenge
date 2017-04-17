feature 'User can log in' do

  let!(:user) do
    User.create(username: "Magnus",
                name: "Magnus Holm",
                email: "mail@magnusholm.com",
                password: "123banana",
                password_confirmation: "123banana")
  end

  scenario 'with correct creditentials' do
    log_in(username: user.username, password: user.password)
    expect(page).to have_content("Welcome to Chitter, #{user.username}")
  end

end
