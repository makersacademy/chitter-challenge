feature 'registration' do
  scenario 'users can register' do
    visit('/users/new')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'jedi')
    click_button('Submit')
    expect(page).to have_content "Welcome test@test.com"
  end
end
