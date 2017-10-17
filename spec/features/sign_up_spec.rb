feature 'Signing up' do
  scenario 'User can sign up to chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Signed in as Chris')
  end

  scenario "User can't sign up without entering email address" do
    expect { sign_up(email: "")}.to change(User, :count).by(0)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario "User must enter valid email address" do
    expect { sign_up(email: "Simon")}.to change(User, :count).by(0)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario "User has already signed up" do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content 'Email is already taken'
  end

end
