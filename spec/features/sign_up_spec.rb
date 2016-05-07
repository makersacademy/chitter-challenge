feature "sign up to chitter" do
  scenario "A user can sign up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Hi, Bob! Welcome to Chitter!'
    expect(User.first.email).to eq 'bob@ross.com'
  end
end
