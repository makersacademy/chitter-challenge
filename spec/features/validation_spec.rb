feature 'Feature - Registration validation' do

  it 'Email address must be a valid email address' do
    visit '/users/new'
    fill_in('first_name', with: 'Test')
    fill_in('last_name', with: 'McTest')
    fill_in('username', with: 'Testannosaurus')
    fill_in('email', with: 'test')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).not_to have_content "Welcome, Testannosaurus"
    expect(page).to have_content "Please use a valid email address"
  end

  it 'Email address already in use cannot be used to signup a new user' do
    visit '/users/new'
    fill_in('first_name', with: 'Test')
    fill_in('last_name', with: 'McTest')
    fill_in('username', with: 'Testannosaurus')
    fill_in('email', with: 'test.mctest@gmail.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    click_button('Sign out')

    visit '/users/new'
    fill_in('first_name', with: 'Test')
    fill_in('last_name', with: 'McTest')
    fill_in('username', with: 'TestTaster')
    fill_in('email', with: 'test.mctest@gmail.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).not_to have_content "Welcome, Testannosaurus"
    expect(page).not_to have_content "Welcome, TestTaster"
    expect(page).to have_content "An account has already been registed with that email address or username."

  end

  it 'Username already in use cannot be used to sign up a new user' do
    visit '/users/new'
    fill_in('first_name', with: 'Test')
    fill_in('last_name', with: 'McTest')
    fill_in('username', with: 'Testannosaurus')
    fill_in('email', with: 'test.mctest@gmail.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    click_button('Sign out')

    visit '/users/new'
    fill_in('first_name', with: 'Test')
    fill_in('last_name', with: 'McTest')
    fill_in('username', with: 'Testannosaurus')
    fill_in('email', with: 'helloworld@gmail.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).not_to have_content "Welcome, Testannosaurus"
    expect(page).to have_content "An account has already been registed with that email address or username."

  end
end
