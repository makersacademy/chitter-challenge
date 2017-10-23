require_relative '../../app/models/peep'

feature 'Newsfeed' do
  scenario 'peeps appear in reverse chronological order' do
    Peep.create(content: "Hello Chitter", created_at: Time.now)
    Peep.create(content: "Goodbye Chitter", created_at: Time.now + 5000)
    Peep.create(content: "Goodbye Chitter", created_at: Time.now + 4000)
    Peep.create(content: "Goodbye Chitter", created_at: Time.now - 1000)
    visit '/peeps'
    timestamps_as_published = page.all('.timestamp').map(&:text)
    timestamps_in_order = timestamps_as_published.sort.reverse
    expect(timestamps_as_published).to eq timestamps_in_order
  end
end
