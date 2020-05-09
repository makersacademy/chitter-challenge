feature 'log out' do
  scenario 'user can log out' do
    User.new(name: 'Dec', user_name: 'dk', email: 'dec@dec.com', password: 'pa55word').save
    visit('/log-in')
    fill_in('username', with: 'dk')
    fill_in('password', with: 'pa55word')
    click_button('log in')
    click_link('log out')
    expect(page).to have_content('log in')
  end
end
