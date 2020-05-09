feature 'Sign up to Chitter' do
  scenario 'user makes a login for Chitter' do
    visit('/peeps/signup')
    fill_in('name', with: 'James Smith')
    fill_in('username', with: 'james_smith')
    fill_in('password', with: 'Password123')
    click_button 'Submit'

    expect(page).to have_content "Chitter Feed"
  end
end
