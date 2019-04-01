feature 'registration' do
  scenario 'User signs up to Chitter app' do
    visit '/registration/signup'
    fill_in('fullname', with: 'Pusheen Cat')
    fill_in('username', with: '@pusheen')
    fill_in('email', with: 'pusheen@test.com')
    fill_in('password', with: 'pusheen-password')
    click_button('Sign Up!')

    expect(page).to have_content "Welcome, @pusheen"
  end
end