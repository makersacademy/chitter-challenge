feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Teste the II')
    fill_in('username', with: 'The Tester 2')
    click_button('Submit')

    expect(page).to have_content "Welcome, The Tester 2"
  end
end
