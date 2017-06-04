feature 'password confirmation' do
  scenario 'user types confirmation incorrectly' do
    expect { sign_up(password_confirmation: 'blabla') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password and confirmation do not match')
  end
end
