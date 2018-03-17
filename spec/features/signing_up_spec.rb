feature 'signing up' do
  scenario 'the user signs up' do
    visit '/'
    click_on 'Sign Up'
    fill_in :user_name, with: 'Dave G. User'
    fill_in :user_password, with: 'password'
    click_on 'Register New User'
    expect(page).to have_content 'Welcome, Dave G. User!'
  end
end
