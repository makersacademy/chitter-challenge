feature 'sign up' do

  scenario 'user can sign up' do
    expect{ sign_up }.to change(User, :count).by(1)
    # expect(page).to have_content('Thank you for signing up, please sign in to continue')
  end

  scenario 'user cannot sign up with the wrong password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario "user cannot signup with an already taken email" do
    sign_up
    expect { sign_up(email: 'aladin@lamp.com') }.not_to change(User, :count)
    expect(page).to have_content("Email is already taken")
  end

  scenario "user cannot signup with an already taken user name" do
    sign_up(email: 'jasmine@lamp.com', user_name: 'aladin')
    expect { sign_up(user_name: 'aladin') }.not_to change(User, :count)
    expect(page).to have_content("User name is already taken")
  end
end
