feature "User sign up" do
  scenario "user visits homepage and fills form to sign up" do
    user = build(:user)
    sign_up(user)

    expect(page.status_code).to be 200
    expect(User.all.length).to eq 1
    expect(User.first.email).to eq 'adil@gmail.com'
    expect(User.first.username).to eq 'adilw3nomad'
    expect(page).to have_content 'Welcome adilw3nomad'
  end
end
