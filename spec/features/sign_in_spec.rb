feature 'User sign in' do

 scenario 'with correct credentials' do
   user = create(:user)
   sign_in(user)
   expect(page).to have_content "Welcome, #{user.full_name}"
 end

  scenario 'with incorrect credentials' do
    user = build(:user, username: "wrong")
    sign_in(user)
    expect(page).to have_content "Sorry, there were the following problems with the form."
    end

end
