feature "signing up with an email already used" do
  scenario "maker cannot sign up with an email already used" do
    valid_sign_up
    expect{ valid_sign_up }.to_not change(Maker, :count)
    expect(page).to have_content 'Email is already taken'
  end
end
