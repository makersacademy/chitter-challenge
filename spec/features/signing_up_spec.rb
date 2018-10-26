feature 'Signing up' do
  scenario 'a user signs up for Chitter' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Username', with: 'Mittens'
    click_button 'Register'
    expect(page).to have_content 'Hi Mittens!'
  end
end
