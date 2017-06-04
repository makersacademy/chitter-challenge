feature 'user sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('kavita@example.com')
    #Be able to see new peep button
  end

  scenario 'sign up requires matching confirmation password' do
    expect { wrong_sign_up }.not_to change(User, :count)
  end

end
