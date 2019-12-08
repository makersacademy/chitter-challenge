RSpec.feature 'login authentication' do
  scenario '' do
    visit '/'
    fill_in 'email', with: 'sam@bademail.com'
    fill_in 'password', with: '1234broccoli'
    click_on 'Log In'
    
    expect(page).to have_content 'Invalid Username or Password'
  end
end
