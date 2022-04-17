feature 'Peeps are seen in reverse chronological order' do
  scenario "See new posts first" do
    user = User.create(
      email: 'test@example.com',
      password: 'test123',
      name: 'Tester Test',
      username: 'TTest'
    )
    Peep.post(peep: "Hey guys! I'm new", user_id: user.id)
    Peep.post(peep: "Hey New! I'm Michael", user_id: user.id)
    that = "Hey guys! I'm new"
    this = "Hey New! I'm Michael"
    visit('/peeps')
    expect(this).to appear_before(that)
  end
end
