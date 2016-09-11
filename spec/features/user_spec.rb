feature "Users sign up" do
  scenario "a user can sign up to Chitter with an email, username and password" do
    expect{ sign_up }.to change(User, :count).by 1
    # expect(page.status_code).to be 200
  end

  scenario "a user cannot sign up with an incorrect email address" do
    sign_up
    expect{ sign_up(email: 'murz.com') }.to_not change(User, :count)
  end

  scenario "a user cannot sign up with the same email address" do
    sign_up
    expect{ sign_up(email: 'murtz@gmail.com')}.to_not change(User, :count)
  end
end
