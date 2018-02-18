feature 'Signing up' do
  scenario 'A user can sign up to Chitter' do
    visit '/sign_up'
    fill_in('full_name', with: 'Heather Stock')
    fill_in('username', with: '@heather')
    fill_in('email', with: 'heather@imail.com')
    fill_in('password', with: 'password')
    click_button 'Submit'
    expect(page).to have_content 'Welcome @heather'
  end
end
