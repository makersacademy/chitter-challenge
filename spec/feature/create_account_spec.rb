feature 'create_account' do
  scenario 'If all details are added and unique, an account is created' do
    visit '/'
    click_button('Log In')
    click_button("Create Account")
    fill_in('username', with: 'Noname')
    fill_in('password', with: 'Um')
    fill_in('name', with: 'Nobody')
    fill_in('email', with: 'this_is_my_email')
    click_button('Submit')
    expect(page).to have_content('successfully created your account')
  end

  scenario 'If the form is not fully completed or is a duplicate, an account is not created' do
    visit '/'
    click_button('Log In')
    click_button("Create Account")
    fill_in('username', with: 'Noname')
    fill_in('password', with: 'Um')
    fill_in('name', with: "Nobody")
    click_button('Submit')
    expect(page).to have_content('Sorry, either that username/password is already taken, or the form wasnt completed correctly')
    fill_in('username', with: 'Noname')
    fill_in('password', with: 'Um')
    fill_in('name', with: 'Nobody')
    fill_in('email', with: 'this_is_my_email')
    click_button('Submit')
    expect(page).to have_content('successfully created your account')
    click_button('back to home')
    click_button('Log In')
    click_button("Create Account")
    fill_in('username', with: 'Noname')
    fill_in('password', with: 'Um')
    fill_in('name', with: 'Nobody')
    fill_in('email', with: 'this_is_my_email')
    click_button('Submit')
    expect(page).to have_content('Sorry, either that username/password is already taken, or the form wasnt completed correctly')
  end
end