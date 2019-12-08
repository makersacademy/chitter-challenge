feature "signing up" do

  scenario "a new user signs up" do
    visit '/'
    click_on("Sign Up")
    expect(current_path).to eq '/users/sign_up'
    fill_in('email', with: "test@mail.com")
    fill_in('password_digest', with:'password')
    click_button("Submit")
    expect(current_path).to eq '/messages'

    
    # fill_in form
    # click_button("Submit")

    # fill_in('msg', with: "hello world")
    # click_button("Post")
    # expect(current_path).to eq '/messages'
    # expect(page).to have_content("hello world")
  end
end