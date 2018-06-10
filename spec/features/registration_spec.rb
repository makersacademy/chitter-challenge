feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    fill_in('username', with: 'stro2275')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, stro2275"
  end
end
