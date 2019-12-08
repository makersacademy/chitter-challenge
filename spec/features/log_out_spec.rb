feature "logging out" do
  scenario "click log out" do
    sign_up "Person", "fake@email.com"

    click_on 'Log out'

    expect(page).to have_link "Sign up"
    expect(page).not_to have_content "Welcome Person"
  end

  scenario "cannot post when logged out" do
    sign_up "Person", "fake@email.com"

    click_on 'Log out'

    expect(page).not_to have_selector "form"
  end
end
