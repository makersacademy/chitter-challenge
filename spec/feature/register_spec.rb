feature 'Register for chitter' do
  scenario 'User registers for chitter and is redirected to login page' do
    visit '/'
    fill_in :current_username, with: 'John'
    click_on 'Register'
    expect(page).to have_content 'Please login'
  end
end