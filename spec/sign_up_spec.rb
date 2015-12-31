
feature 'sign up' do
  scenario 'allows user to sign up for chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, joe_bloggs@gmail.com')
    expect(User.first.email).to eq('joe_bloggs@gmail.com')
  end

  scenario 'requires a matching password for confirmation' do
    expect {sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'requires an email address to sign up' do
    expect {sign_up(email: nil)}.not_to change(User, :count)
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end
end
