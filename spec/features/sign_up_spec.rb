feature 'Registration' do
  scenario 'A user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'example@example.co.uk')
    fill_in('password', with: 'password')
    click_button('Sign up')
    expect(page).to have_content 'Welcome, example@example.co.uk'
  end
end
