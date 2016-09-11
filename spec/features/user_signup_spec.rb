feature "Users sign up" do
  scenario "a user can sign up to Chitter with an email, username and password" do
    expect{ sign_up }.to change(User, :count).by 1
    # expect(page.status_code).to be 200
  end

  scenario "a user cannot sign up with an incorrect email address" do
    sign_up
    expect{ sign_up(email: 'murz.com') }.to_not change(User, :count)
  end

  scenario "user cannot sign up with mismatching passwords" do
    expect {sign_up(password_confirmation: '5432')}.to_not change(User, :count)
  end

  scenario "a user cannot sign up with the same email address" do
    sign_up
    expect{ sign_up(email: 'murtz@gmail.com')}.to_not change(User, :count)
  end

  scenario "a user cannot sign up with the same username" do
    sign_up
    expect{ sign_up(username: 'mrmurtz')}.to_not change(User, :count)
  end
end


feature "User sign up error messages" do

  scenario 'show error is password mismatch' do
    sign_up(password_confirmation: '54311')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "show error if email address already taken" do
    sign_up
    sign_up(email: 'murtz@gmail.com')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email is already taken'
  end

  scenario "show error if username already taken" do
    sign_up
    sign_up(email: 'mrmurtz')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Username is already taken'
  end

  scenario "show error message for incorrect email address format " do
    sign_up(email: 'murtz.co')
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email has an invalid format'
  end
end
