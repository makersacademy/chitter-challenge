feature 'shows all author peeps' do
  scenario 'peeps have the author displayed' do
    user1 = User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
    user2 = User.create(name: 'Trump', username: 'MockingTrump', email: 'mock@trump.com', password: 'psw123')
    Peep.create(user_id: user1.id, content: 'Peep 1')
    Peep.create(user_id: user2.id, content: 'I am Trump')
    Peep.create(user_id: user1.id, content: 'Peep 2')

    visit '/'
    click_link('uValente', match: :first)
    expect(page).to have_current_path("/users/#{user1.id}")
    expect(page).to have_content(/Peep 2.*Peep 1/)
    expect(page).not_to have_content("MockingTrump")
  end
end
