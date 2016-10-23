feature 'Signup' do
  scenario 'A logged out user can create a new user account' do
    create_account
    expect(User.count).to eq 1
  end

  scenario "A user cannot sign up without an email address" do
   expect { sign_up(email: nil) }.not_to change(User, :count)
 end
end
