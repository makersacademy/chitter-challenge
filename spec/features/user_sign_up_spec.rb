feature 'User can sign up' do
  scenario 'When user visits the home page they can see the sign-up button' do
    visit '/chitter'
    expect(page).to have_button "Sign Up to Chitter"
  end

  scenario 'When user selects the sign-up button from the home page' do
    visit '/chitter'
    click_button "Sign Up to Chitter"
    expect(page).to have_content "Welcome to Chitter Sign-Up!"
  end

  scenario 'When user visits the sign-up page they see the correct fields' do
    visit '/chitter/sign_up'
    expect(page).to have_content "Welcome to Chitter Sign-Up!"
    expect(page).to have_css("input", :count => 6)
  end

  scenario 'When user visits the sign-up page they can register' do
    visit '/chitter/sign_up'

    fill_in "email", with: "samantha.ixer@here.com"
    fill_in "password", with: "passwordtest"
    fill_in "first_name", with: "Sam"
    fill_in "surname", with: "Ixer"
    fill_in "username", with: "sami"
    click_button "Sign Up"

    expect(page).to have_content "Thank you, you have successfully signed up"
    expect(page).to have_button "See peeps"
  end

end
