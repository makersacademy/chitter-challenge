feature 'Sign up' do
  scenario 'A user is able to find a button to sign up' do
    visit('/')

    expect(page).to have_button('Sign up')
    expect(page).to_not have_content('New blah')
  end

  scenario 'A user clicks sign up, then taken to the sign up page' do
    visit('/')
    click_button('Sign up')

    expect(page).to have_content('Join BlahBlah today.')
    expect(page).to have_css("input#name")
    expect(page).to have_css("input#username")
    expect(page).to have_css("input#email")
    expect(page).to have_css("input#password")
  end

  scenario 'A user enters details and able to sign in' do
    visit('/')
    click_button('Sign up')

    fill_in('name', with: 'A Name')
    fill_in('username', with: 'AName')
    fill_in('email', with: 'aname@aemail.com')
    fill_in('password', with: 'apassword')
    click_button('Sign up')

    expect(page).to have_content('AName')
    expect(page).to have_content('Add blah')
  end
end
