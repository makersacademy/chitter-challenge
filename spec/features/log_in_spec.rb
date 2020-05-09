feature 'log in' do
  scenario 'user can log in' do
    User.new(name: 'Dec', user_name: 'dk', email: 'dec@dec.com', password: 'pa55word').save
    visit('/log-in')
    fill_in('username', with: 'dk')
    fill_in('password', with: 'pa55word')
    click_button('log in')
    expect(page).to have_content("You're signed in as dk.")
  end

  scenario 'there is a log in link on the peeps page' do
    visit('/peeps')
    click_link('log in')
    expect(page).to have_current_path('/log-in')
  end

  scenario 'log in link does not appear when signed in' do
    User.new(name: 'Dec', user_name: 'dk', email: 'dec@dec.com', password: 'pa55word').save
    visit('/log-in')
    fill_in('username', with: 'dk')
    fill_in('password', with: 'pa55word')
    click_button('log in')
    expect(page).to_not have_content('log in')
  end
end
