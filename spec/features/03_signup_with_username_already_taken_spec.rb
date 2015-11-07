feature "signing up with a username already used" do
  scenario "maker cannot sign up with a username already used" do
    valid_sign_up
    expect{ sign_up_with_same_username }.to_not change(Maker, :count)
    expect(page).to have_content 'Username already taken.'
  end
end
