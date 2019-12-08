feature "signing up" do

  scenario "a new user signs up" do
    visit '/'
    click_on("Sign Up")
    expect(current_path).to eq '/users/sign_up'
    fill_in('email', with: "test@mail.com")
    fill_in('password', with:'password')
    click_button("Submit")
    expect(current_path).to eq '/messages/new'

  end
end