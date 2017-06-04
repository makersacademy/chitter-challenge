feature 'User sign up' do
  scenario 'I want to sign up to chitter with a username and an email' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq 'test@mail.com'

    expect(current_path).to eq '/chits'

    expect(page).to have_content 'Signed up as: Tester'
    expect(page).to have_content 'test@mail.com'
  end

  scenario "I can't sign up with an already registered email" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end
  
  scenario "I can't sign up with an already registered username" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content 'Username is already taken'
  end
end
