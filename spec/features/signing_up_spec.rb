# User Story One
#
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  scenario 'be able to sign up for Chitter' do
    visit ('/')
    fill_in 'name', with: 'Test User Name'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'qwerty'
    fill_in 'passpord_confirmation', with: 'qwerty'
    click_button 'sign up'
    expect(current_path).to eq '/peeps'
  end
end
