feature "User sign up" do
  scenario "user can sign up" do
    expect { sign_up }.to change { User.count }.by 1
    expect(page).to have_content "Welcome Luke"
    expect(User.last.username).to eq "skywalker"
    expect(User.last.email).to eq "luke@starwars.com"
  end
end
