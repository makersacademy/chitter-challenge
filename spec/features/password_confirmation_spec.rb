feature "password confirmation" do

  scenario "does not create new user when mismatching password confirmation" do
    expect{ sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
  end

  scenario "raise error with password that does not match" do
    expect{ sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(current_path).to eq('/sign-up')
    expect(page).to have_content('Password does not match the confirmation')
  end

end
