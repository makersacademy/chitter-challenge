feature 'you can log out' do
  scenario 'after registering you can log out' do
    register_frodo_swaggins
    click_on 'logout'
    expect(page).to_not have_button 'peep'
  end

  scenario 'after logging in you can log out' do
    login_as_gimli
    click_on 'logout'
    expect(page).to_not have_button 'peep'
  end
end
