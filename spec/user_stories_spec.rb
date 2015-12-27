# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'Sign up' do
  scenario 'users can sign up for Chitter' do
    visit '/sign_up'
    fill_in(:name, with: 'chuck')
    fill_in(:email, with: 'chuckypdawg@gmail.com')
    fill_in(:username, with: 'chuckypdawg')
    fill_in(:password, with: '12345')
    click_button('Submit')
    expect(page).to have_content('Welcome chuck')
  end
end
