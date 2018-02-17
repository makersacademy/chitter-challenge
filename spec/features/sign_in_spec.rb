feature 'sign in' do
  scenario 'with correct password' do
    visit '/'
    fill_in 'username', with: 'test_user'
    click_button 'sign-in'
    expect(page).to have_content "Welcome test_user"
  end

  scenario 'with incorrect password' do

  end
end
