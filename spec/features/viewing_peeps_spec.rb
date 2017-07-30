feature 'Viewing peeps' do
    before(:each) do
      visit '/users/new'
      user = User.create(name:'bob', username:'@bobv', email: 'bob@gmail.com', password:'pass', password_confirmation: 'pass')
      visit '/peeps/new'
      @peep = Peep.create(name: user.name, username: user.username, user_id: user.id, message: "Today is a great day!")
      visit '/peeps'
    end

  scenario 'I can view my peeps and the time it was sent' do
    within 'ul#peeps' do
    expect(page).to have_content "Today is a great day!"
    expect(page).to have_content "Posted at: #{@peep.created_at}"
    end
  end

  scenario 'peeps contain name and username' do
    expect(page).to have_content('bob')
    expect(page).to have_content('@bobv')
  end
end
