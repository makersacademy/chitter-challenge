feature 'Signing up' do
  scenario 'a user signs up for Chitter' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'username', with: 'Mittens'
    click_button 'Register'
    expect(page.find('.user')).to have_content 'Hi, Mittens!'
    expect(page).not_to have_content 'Sign Up'
  end
end
