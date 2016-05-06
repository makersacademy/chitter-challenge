

feature 'User sign in and out' do

  let(:user) do
    User.create(SessionHelpers::PARAMS_CORRECT)
  end

  scenario 'sign in with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.email}"
  end
end

feature 'User signs out' do

  let(:user) do
    User.create(SessionHelpers::PARAMS_CORRECT)
  end

  scenario 'while being signed in' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content('Welcome, test@test.com')
  end

end