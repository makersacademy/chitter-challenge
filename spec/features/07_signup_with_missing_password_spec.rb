feature "signing up without a password" do
  scenario "maker cannot sign up without a password" do
    expect{ sign_up_without_password }.to_not change(Maker, :count)
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
