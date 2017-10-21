require_relative '../../app/models/peep'

feature 'Newsfeed' do
  scenario 'user is able to see peeps' do
    Peep.create(content: "Hello Chitter", created_at: Time.now)
    visit '/peeps'
    expect(page).to have_content "Hello Chitter"
  end
  scenario 'peeps appear in reverse chronological order' do
    peep1 = Peep.create(content: "Hello Chitter", created_at: Time.now)
    peep2 = Peep.create(content: "Goodbye Chitter", created_at: Time.now + 5000)
    peep3 = Peep.create(content: "Goodbye Chitter", created_at: Time.now + 4000)
    peep4 = Peep.create(content: "Goodbye Chitter", created_at: Time.now - 1000)
    visit '/peeps'
    timestamps_as_published = page.all('.timestamp').map(&:text)
    timestamps_in_order = timestamps_as_published.sort.reverse
    expect(timestamps_as_published).to eq timestamps_in_order
  end
end
