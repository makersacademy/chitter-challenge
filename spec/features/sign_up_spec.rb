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
end
