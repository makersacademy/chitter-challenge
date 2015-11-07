feature "signing up without a username" do
  scenario "maker cannot sign up without a username" do
    expect{ sign_up_without_username }.to_not change(Maker, :count)
    expect(page).to have_content 'Username required.'
  end
end
