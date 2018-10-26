feature 'Signing up' do
  scenario 'a user signs up for Chitter' do
    visit '/sign-up'
    fill_in 'username', with: 'Mittens'
    fill_in 'password', with: 'password'
    click_button 'Register'
    expect(page.find('.user')).to have_content 'Hi, Mittens!'
    expect(page).not_to have_content 'Sign Up'
  end
end
