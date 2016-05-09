feature "User Sign In" do
  scenario " with right credentials" do
    user = create(:user)
    sign_in(user)
    expect(page.status_code).to be 200
    expect(page).to have_content 'Welcome adilw3nomad'
  end

  scenario "with wrong credentials" do
    user = create(:user)
    visit '/sessions/new'
    fill_in('email', with: user.email)
    fill_in('password', with: '2345')
    click_button('Sign In')
    expect(page.status_code).to be 200
    expect(page).not_to have_content 'Welcome adilw3nomad'
    expect(page).to have_content 'The email or password was incorrect'
  end
end
