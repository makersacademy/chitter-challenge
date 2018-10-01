xfeature 'send a message' do
  scenario 'upload a message' do
    sign_in_and_tweet
    expect(page).to have_content "ahoy mateys, here's me 'ahoy world'!"
  end
end

xfeature 'expect to see post time' do
  scenario 'sees time posted' do
    sign_in_and_tweet
    expect(page).to have_text(Time.now.strftime("Posted on %m/%d at %I:%M%p"))
  end
end

xfeature 'authentication' do
  scenario 'a user can sign out' do
    User.create(email: 'test@mail.com', password: '123', username: 'melon')
    visit '/login'
    fill_in('email', with: 'test@mail.com')
    fill_in('password', with: '123')
    click_button('Sign In')
    expect(current_path).to eq '/dashboard'
    click_button('Sign Out')
    expect(page).not_to have_content("Ahoy, melon!")
    expect(page).to have_content("Successfully logged out!")
  end
end