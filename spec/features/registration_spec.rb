feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'testname')
    fill_in('username', with: 'testusername')
    click_button('Submit')

    expect(page).to have_content "Welcome, testname"
  end

  scenario 'a user can not sign up with same email twice' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'testname2')
    fill_in('username', with: 'testusername2')
    click_button('Submit')

    expect(page).to_not have_content "Welcome, testname2"
  end

  scenario 'a user can not sign up with same username twice' do
    visit '/users/new'
    fill_in('email', with: 'test2@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'testname2')
    fill_in('username', with: 'testusername')
    click_button('Submit')

    expect(page).to_not have_content "Welcome, testname2"
  end
end