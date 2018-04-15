feature 'registration' do
  scenario 'a Maker can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'abcde998')
    fill_in('name', with: 'Andrew Test')
    fill_in('username', with: 'test_user1')
    click_button('Submit')

    expect(page).to have_content "Welcome, test_user1"

  end
end
