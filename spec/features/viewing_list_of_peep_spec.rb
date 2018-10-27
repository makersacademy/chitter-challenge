feature 'Viewing the list of peeps on the homepage' do
  scenario 'see the time at which the peep was made' do
    user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    peep = Peep.create(text: "peep1", user_id: user.id)
    visit '/'
    expect(page).to have_content("#{peep.text}\n#{peep.time}")
  end
  scenario 'see the peep list in reverse chronological order' do
    user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    peep1 = Peep.create(text: "peep1", user_id: user.id)
    peep2 = Peep.create(text: "peep2", user_id: user.id)
    visit '/'
    expect(page).to have_content("#{peep2.text}\n#{peep2.time}\n#{peep1.text}\n#{peep1.time}")
  end
end
