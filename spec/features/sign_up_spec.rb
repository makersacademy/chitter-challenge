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
  end

  scenario "doesn't allow user to sign up with invalid email " do

  end

  scenario "doesn't allow user to sign up with an existing email" do

  end

  scenario "doesn't allow user to sign up if password and confirm password don't match" do

  end

  scenario "doesn't allow user to sign up without a password of min 4 chars" do

  end

  scenario "doesn't allow user to sign up without a unique username" do

  end

end
