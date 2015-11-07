feature "signing up without a password confirmation" do
  scenario "maker cannot sign up without a password confirmation" do
    expect{ sign_up_without_password_confirmation }.to_not change(Maker, :count)
    expect(page).to have_content 'Password confirmation required.'
  end

  scenario "maker cannot sign up if passwords are not matching" do
    expect{ sign_up_without_passwords_matching }.to_not change(Maker, :count)
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
