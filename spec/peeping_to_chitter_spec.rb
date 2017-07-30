=begin
As a Maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter
=end

feature 'Posting messages (peeps)' do
  scenario 'I can post a message' do
    Peep.create(title: 'First message', message: 'My first message!')

    visit '/peeps'

    expect(page.status_code).to eq 200

    within 'peeps' do
      expect(page).to have_content('My first message!')
    end
  end
end
