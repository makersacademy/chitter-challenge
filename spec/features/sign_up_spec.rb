feature "Sign up" do
  scenario 'user can sign up to use chitter' do
    visit ('/account/new')
    expect(page).to have_content 'Create a new account'
    expect(page).to have_content 'Username:'
    expect(page).to have_content 'Email Address:'
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Full Name'

    fill_in :username, with: "test1"
    fill_in :email_address, with: "test1@test.com"
    fill_in :password, with: "test1"
    fill_in :full_name, with: "testy test"

    expect(page).to have_button
    click_button
  end

# Feature not yet implemted 
  # scenario "user can't sign up to use chitter - user already exists" do
  #   fill_in :username, with: "test1"
  #   fill_in :email_address, with: "test1@test.com"
  #   fill_in :password, with: "test1"
  #   fill_in :full_name, with: "testy test"
  #   click_button

  #   fill_in :username, with: "test1"
  #   fill_in :email_address, with: "test1@test.com"
  #   fill_in :password, with: "test1"
  #   fill_in :full_name, with: "testy test"
  #   click_button

  #   expect(page).to have_content "error: this username or email already exists"
  # end
end
