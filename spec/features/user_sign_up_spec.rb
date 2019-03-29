feature 'User can sign up' do
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
