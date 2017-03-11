# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature "New user should be able to register/sign up" do

  scenario "allows user to sign up with all the details" do
    visit('/users/new')
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'test'
    fill_in :password_confirmation, with: 'test'
    fill_in :name, with: 'Elizabeth Windsor'
    fill_in :username, with: 'ewindsor'
    expect{click_button 'Sign Up'}.to change(User, :count)
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content('Welcome, test@test.com')
  end

  scenario "doesn't allow user to sign up without email" do
    visit('/users/new')
    expect{click_button 'Sign Up'}.to_not change(User, :count)
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('We need your email address.')
    expect(page).to have_content('We need you to enter a username')
  end

  scenario "doesn't allow user to sign up with invalid email " do
    visit('/users/new')
    fill_in :email, with: 'invalid@mail'
    expect{click_button 'Sign Up'}.to_not change(User, :count)
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content("Doesn't look like an email address to me ...")
  end

  scenario "doesn't allow user to sign up with an existing email" do
    User.create(email: 'test@test.com', password: 'test', password_confirmation: 'test', name: 'Ex Name', username: 'ename')
    visit('/users/new')
    fill_in :email, with: 'test@test.com'
    expect{click_button 'Sign Up'}.to_not change(User, :count)
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content("We already have that email.")
  end

  scenario "doesn't allow user to sign up if password and confirm password don't match" do
    visit('/users/new')
    fill_in :email, with: 'test@test.com'
    fill_in :password, with: 'test1'
    fill_in :password_confirmation, with: 'test2'
    fill_in :name, with: 'Elizabeth Windsor'
    fill_in :username, with: 'ewindsor'
    expect{click_button 'Sign Up'}.to_not change(User, :count)
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('Password and confirmation password do not match')
  end

  scenario "doesn't allow user to sign up without a unique username" do
    User.create(email: 'test@test.com', password: 'test', password_confirmation: 'test', name: 'Ex Name', username: 'ename')
    visit('/users/new')
    fill_in :email, with: 'test_next@test.com'
    fill_in :password, with: 'test'
    fill_in :password_confirmation, with: 'test'
    fill_in :name, with: 'Elizabeth Windsor'
    fill_in :username, with: 'ename'
    expect{click_button 'Sign Up'}.to_not change(User, :count)
    expect(page).to have_current_path('/users/new')
    expect(page).to have_content('We already have that username.')
  end

end
