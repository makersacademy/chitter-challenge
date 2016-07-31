feature "Signing up" do
  scenario "A user can sign up for an account" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('example@email.com')
    expect(page).to have_content("Welcome to Chitter, example_username")
  end
end

feature "Signing in" do
  scenario "A user can sign in to their account" do
    sign_up
    sign_in
    expect(page).to have_content("Welcome to Chitter, example_username")
  end
  scenario 'A user is shown an error if the password is incorrect' do
    sign_up
    sign_in(password: 'wrong')
    expect(page).to have_content('The email or password is incorrect')
  end
  scenario 'A user is shown an error if the email is incorrect' do
    sign_up
    sign_in(email: 'banana')
    expect(page).to have_content('The email or password is incorrect')
  end
end
