feature 'user can sign up to Chitter' do
  scenario 'go to sign up page and user signs up' do
    visit('/signup')
    fill_in('username', with: 'John Smith')
    fill_in('password', with: 'password12345')
    click_button 'Sign up'

    expect(page).to have_content 'Welcome to Chitter'
  end
end
    