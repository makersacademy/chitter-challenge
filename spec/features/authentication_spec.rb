feature 'authentication' do
  scenario 'user is able to sign in successfully' do
    User.create(email: 'telgi@gmail.com', password: 'password2')
    visit '/sessions/new'
    fill_in "email", with: 'telgi@gmail.com'
    fill_in "password", with: 'password2'
    click_button "Sign In"

    expect(page).to have_content 'Hello, telgi@gmail.com'
  end

  scenario 'user sees an error if they put the wrong email' do
    User.create(email: 'telgi@gmail.com', password: 'password2')
    visit '/sessions/new'
    fill_in "email", with: 'tel@gmail.com'
    fill_in "password", with: 'password2'
    click_button "Sign In"

    expect(page).not_to have_content "Hello, telgi@gmail.com"
    expect(page).to have_content "Incorrect info - please try again."
  end

  scenario 'user sees an error if they put the wrong password' do
    User.create(email: 'telgi@gmail.com', password: 'password2')
    visit '/sessions/new'
    fill_in "email", with: 'telgi@gmail.com'
    fill_in "password", with: 'pasworld2'
    click_button "Sign In"

    expect(page).not_to have_content "Hello, telgi@gmail.com"
    expect(page).to have_content "Incorrect info - please try again."
  end
end
