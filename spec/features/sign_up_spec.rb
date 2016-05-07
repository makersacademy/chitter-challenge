feature 'user can sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up('alice@example.com', 'orange', 'orange') }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'cannot sign up if password confirmation does not match' do

    expect { sign_up('alice@example.com', 'orange', 'apple') }.not_to change(User, :count)
    expect(page).to have_content 'Password and confirmation password do not match'

  end

end