feature 'Viewing the list of peeps on the homepage' do
  scenario 'see the time at which the peep was made' do
    user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    peep = Peep.create(text: "peep1", user_id: user.id)
    visit '/'
    expect(page).to have_content("#{peep.text}\nat #{peep.time}")
  end
  scenario 'see the peep list in reverse chronological order' do
    user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    peep1 = Peep.create(text: "peep1", user_id: user.id)
    peep2 = Peep.create(text: "peep2", user_id: user.id)
    visit '/'
    # expect(page).to have_content
    expect(first('.peep')).to have_content "peep2"
  end
  scenario 'see the the user for each peep with a link to their profile' do
    user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    peep = Peep.create(text: "peep1", user_id: user.id)
    visit '/'
    expect(page).to have_content("#{peep.text}")
    expect(page).to have_link("#{user.username}", href: "/users/#{user.username}/peeps")
  end

end
