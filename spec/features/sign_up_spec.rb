# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "can sign up for chitter" do
  scenario "create account" do
    visit '/feed'
    click_button 'signup'
    fill_in('name', with: 'Sam')
    fill_in('username', with: 'LazSam')
    fill_in('email', with: 's@h.com')
    fill_in('password', with: 'ram')
    click_button 'complete signup'
    expect(page).to have_content 'You have created an account'
  end
end
