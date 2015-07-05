feature 'User sign up' do

  let (:user) do
    build :user
  end

  scenario 'can signup as new user' do
    expect { sign_up user }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome #{user.username}"


  end
end