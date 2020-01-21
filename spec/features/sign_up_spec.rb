feature 'Sign up to Chitter' do
  scenario 'User can sign up to Chitter' do
    visit('/')
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'test1234'
    fill_in :name, with: 'Test'
    fill_in :username, with: 'test'
    click_button 'Sign Up'
    expect(page).to have_content('Welcome To Chitter, test!')
  end
end
