RSpec.feature 'signing up' do
  scenario 'a new user wants to sign up to chitter' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'new username', with: 'New User'
    fill_in 'new password', with: '1234567890'
    click_on 'Sign Up'

    expect(page).to have_content 'Chitter'
  end
end
