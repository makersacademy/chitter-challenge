feature "User can log out" do
  scenario "user can log out on peep page" do
    sign_up
    log_in
    add_peep

    visit('/peep')
    connection = PG.connect(dbname: 'chitter_test')
    Peep.create(peep_text: 'Every application somehow needs PosgreSQL', user_id: '45')
    click_button 'Log out'
    expect(page).to have_current_path('/login')
  end
end
