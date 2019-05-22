feature 'User can sign up' do
  scenario 'When user visits the home page they can see the sign-up button' do
    visit '/chitter'
    expect(page).to have_button "Sign Up to Chitter"
  end

  scenario 'When user selects the sign-up button from the home page' do
    go_to_sign_up
    expect(page).to have_content "Welcome to Chitter Sign-Up!"
  end

  scenario 'When user visits the sign-up page they see the correct fields' do
    go_to_sign_up
    expect(page).to have_content "Welcome to Chitter Sign-Up!"
    expect(page).to have_css("input", :count => 6)
  end

  scenario 'When user visits the sign-up page they can register' do
    go_to_sign_up
    sign_up

    expect(page).to have_content "Thank you, you have successfully signed up"
    expect(page).to have_button "See peeps"
  end

  scenario 'When user tries to sign-up with an existing email address they see an error' do
    go_to_sign_up
    sign_up

    go_to_sign_up
    sign_up

    expect(page).to have_content "The username or email address you entered is already in use"
    expect(page).to have_button "See peeps"
  end
end
