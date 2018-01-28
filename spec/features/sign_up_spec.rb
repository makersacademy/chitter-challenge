feature 'sign up' do
  scenario 'register as a chitter user' do
    sign_up
    expect(User.first.email).to eq 'test@test.com'
  end
  scenario 'the user\'s information is displayed on the links page' do
    sign_up
    expect(page).to have_content('Welcome, Roxy')
  end
end
