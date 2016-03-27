feature 'User sign up' do
  scenario 'I can sign up as a new user' do

    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Simon')
    expect(User.first.email).to eq('test@test.com')
  end

  scenario "If I get my password wrong I won't be logged in" do

    expect { sign_up_not_matching_password }.not_to change(User, :count)
    expect(page).to have_content('Incorrect password')
    expect(User.first.email).to eq('test@test.com')
  end

end
