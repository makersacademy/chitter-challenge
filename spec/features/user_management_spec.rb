
feature 'User sign up' do

  def sign_up
    visit '/users/new'
    fill_in :name, with: "John Smith"
    fill_in :email, with: "john.smith@example.com"
    fill_in :username, with: "jsmith"
    fill_in :password, with: "12345"
    click_button('Sign up')
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to(have_content("Hello, jsmith"))
    expect(User.first.email).to(eq("john.smith@example.com"))
  end

end
