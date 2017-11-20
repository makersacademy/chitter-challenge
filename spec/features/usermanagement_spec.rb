feature 'User sign up' do
  scenario 'User signs up as a Chitteroo member' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Hey thatdania!')
    expect(User.first.email).to eq('thatdania@gmail.com')
  end

  scenario 'Sign up page requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario "User can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

end
