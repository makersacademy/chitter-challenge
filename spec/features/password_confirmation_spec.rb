feature 'password confirmation' do
  scenario 'user types confirmation incorrectly' do
    expect { sign_up(password_confirmation: 'blabla') }.not_to change(User, :count)
  end
end
