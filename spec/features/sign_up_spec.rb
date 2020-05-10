feature 'sign up' do
  scenario 'user can sign up' do
    visit('/sign-up')
    fill_in('name', with: 'Dec')
    fill_in('username', with: 'dk')
    fill_in('email', with: 'dec@dec.com')
    fill_in('password', with: 'pa55word')
    click_button('sign up')
    expect(User.all(User.user_name => 'dk').first).to be_a_kind_of(User)
  end

  scenario 'sign up link is dispalyed if user is not logged in' do
    visit('/peeps')
    expect(page).to have_link('Sign up')
  end

  scenario 'sign up link is NOT dispalyed if user IS logged in' do
    log_in
    expect(page).to_not have_link('Sign up')
  end
end
