feature "Users sign up" do
  scenario "a user can sign up to Chitter with an email, username and password" do
    expect(page.status_code).to be 200
    expect{ sign_up }.to change(User, :count).by 1
  end
end
