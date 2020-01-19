feature 'shows peeps' do
  scenario 'index shows all peeps in reverse chonological order' do
    user = User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
    Peep.create(user_id: user.id, content: 'Peep 1')
    Peep.create(user_id: user.id, content: 'Peep 2')

    visit '/'
    expect(page).to have_content(/Peep 2.*Peep 1/)
  end

  scenario 'peeps have the creation date displayed' do
    user = User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
    peep1 = Peep.create(user_id: user.id, content: 'Peep 1')
    peep2 = Peep.create(user_id: user.id, content: 'Peep 2')

    visit '/'
    expect(page).to have_content("#{peep1.created_on}")
    expect(page).to have_content("#{peep2.created_on}")
  end

  scenario 'peeps have the author displayed' do
    user1 = User.create(name: 'Umberto', username: 'uValente', email: 'mock@gmail.com', password: 'psw123')
    user2 = User.create(name: 'Trump', username: 'MockingTrump', email: 'mock@trump.com', password: 'psw123')
    Peep.create(user_id: user1.id, content: 'Peep 1')
    Peep.create(user_id: user2.id, content: 'Peep 2')

    visit '/'
    expect(page).to have_content("uValente")
    expect(page).to have_content("MockingTrump")
  end
end
