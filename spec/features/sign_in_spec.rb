require 'helpers/session'

feature 'User sign in' do

  let!(:user) do
    User.create(email: 'nemo@clownfish.com', password: 'dory', name: 'Nemo', username: 'Nemo123')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome #{user.email}"
  end
end
