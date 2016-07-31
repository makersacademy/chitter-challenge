feature "User sign up" do
  scenario "New users can sign up to Chitter" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, chitbot!')
    expect(User.first.email).to eq('bot@bot.com')
    expect(User.first.username).to eq('chitbot')
    expect(User.first.name).to eq('Mr Chit Bot')
  end

  # scenario "I can't sign up without an email address" do
  #   expect { sign_up(email: nil) }.not_to change(User, :count)
  # end
  #
  # scenario "I can't sign up with an invalid email address" do
  #   expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  # end
end
