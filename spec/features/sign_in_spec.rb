feature "User Sign In" do
  scenario " with right credentials" do
    user = create(:user)
    p user.password
    sign_in(user)
    expect(page.status_code).to be 200
    expect(page).to have_content 'Welcome adilw3nomad'
  end
end
