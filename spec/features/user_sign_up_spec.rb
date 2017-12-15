feature "sign up form" do
  scenario "signing up and entering as user" do
    visit('/user/new')
    fill_in "email", with: "me@me.com"
    fill_in "name", with: "Ellie W"
    fill_in "username", with: "winnie"
    fill_in "password", with: "pass2017"
    click_button("Sign up")
    expect(current_path).to eq('/')
  end
end
