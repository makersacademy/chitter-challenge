feature 'viewing the list of peeps on the homepage' do
  scenario 'see the time at which the peep was made' do
    user = User.create(name: 'John', username: 'john', email: 'john@example.com', password: 'password123')
    peep = Peep.create(text: "peep1", user_id: user.id)
    visit '/'
    expect(page).to have_content("#{peep.text}\n#{peep.time}")
  end
end
