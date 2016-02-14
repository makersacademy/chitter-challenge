feature 'sign in' do
  before(:all) do
    sign_up
  end

  scenario 'user signs in correctly' do
    sign_in
    expect(page).to have_content 'You are now logged in.'
  end

  scenario 'user enters incorrect credentials' do
    sign_in(password: 'wrongpassword')
    expect(page).to have_content 'The email or password was incorrect'
  end

  scenario 'when user has forgotten password they can request a reset' do
    visit '/sessions/new'
    click_link 'I forgot my password'
    expect(page).to have_content("Please enter your email address")
  end
end
