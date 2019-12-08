feature "loggin in" do
  scenario "log in to an existing user" do
    sign_up "Alastair", "this@that.com", username: "alastair", password: "p4ssw0rD"

    click_on 'Log out'

    click_on 'Log in'

    fill_in 'username', with: 'alastair'
    fill_in 'password', with: 'p4ssw0rD'
    click_button 'Log in'

    expect(page).to have_content "Welcome Alastair"
    expect(page).not_to have_link 'Sign up'
    expect(page).not_to have_link 'Log in'
    expect(page).to have_selector 'form'
  end

  scenario "logging in with the wrong credentials gives an message" do
    sign_up "Alastair", "this@that.com", username: "alastair", password: "p4ssw0rD"

    click_on 'Log out'

    click_on 'Log in'

    fill_in 'username', with: 'lastair'
    fill_in 'password', with: 'p4ssw0rD'
    click_button 'Log in'

    expect(page).to have_content "Username or password incorrect"

    fill_in 'username', with: 'alastair'
    fill_in 'password', with: 'pAssw0rD'
    click_button 'Log in'

    expect(page).to have_content "Username or password incorrect"
  end
end
