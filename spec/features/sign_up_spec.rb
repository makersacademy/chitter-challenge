feature 'Sign up' do

  scenario 'A new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, user'
    expect(User.first.email).to eq('email@example.com')
  end

  scenario "A user can't sign up with an existing username" do
    sign_up
    expect {sign_up }.to_not change(User, :count)
    expect(page).to have_content('Username is already taken')
  end
  scenario "A user can't sign up without a username" do
    expect { sign_up(username: nil) }.not_to change(User, :count)
  end


  scenario "A user can't sign up with an existing email" do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
