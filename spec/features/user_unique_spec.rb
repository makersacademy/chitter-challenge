feature 'username and email should be unique' do

  scenario 'cannot register two users with the same username' do
    create_user_alice
    expect do
      sign_up(email: 'notalice@example.com', name: 'Not Alice')
    end.not_to change(User, :count)
    expect(page).to have_content "This username has been registered"
  end

  scenario 'cannot register two users with the same email addresss' do
    create_user_alice
    expect do
      sign_up(name: 'Not Alice', username: 'Not Wonderland')
    end.not_to change(User, :count)
    expect(page).to have_content "This email has been registered"
  end

end