feature 'User sign in' do

  scenario 'successful sign in' do
    user = create(:user)
    sign_in(user)
    expect(page).to have_content "Welcome #{user.name}!"
  end

  scenario 'unsuccessful sign in' do
    user = build(:user)
    sign_in(user)
    expect(page).to have_content "The email or password is incorrect"
  end

end
