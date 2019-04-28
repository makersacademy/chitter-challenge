feature 'log in ' do
  scenario 'log in with email and password' do
    visit '/'
    fill_in('sign_up_name', with: 'Simon')
    fill_in('sign_up_username', with: 'SY')
    fill_in('sign_up_email', with: 'email@example.com')
    fill_in('sign_up_password', with: 'password123')

    click_button('sign up')
    expect(current_path).to eq "/"

    fill_in('email', with: 'email@example.com')
    fill_in('password', with: 'password123')
    click_button('login')

    expect(page).to have_selector("input[type=submit][value='post message']")
  end

end
