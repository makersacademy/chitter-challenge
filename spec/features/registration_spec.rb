feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_link 'register'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "user: test@example.com"
  end
end
