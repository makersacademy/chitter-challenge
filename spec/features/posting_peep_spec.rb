# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'Posting peeps' do
  scenario 'Create new message while logged in' do
    peep = build(:peep)
    user = create(:user)
    sign_in(user)
    expect { post_peep(peep) }.to change(Peep, :count).by(1)
    expect(page).to have_content peep.content
    expect(Peep.first.content).to eq(peep.content)
  end

  scenario 'Create new message while not logged in' do
    peep = build(:peep)
    expect { post_peep(peep) }.not_to change(Peep, :count)
    expect(page).to have_content 'You must be logged in to peep!'
  end

  scenario 'creates peep above character limit' do
    message = 'This is a peep containing more than 140 characters.'\
    'DataMapper should not add it to the peeps table.'\
    'The user should get the appropriate error message.'
    peep = build(:peep, content: message)
    user = create(:user)
    sign_in(user)
    expect { post_peep(peep) }.not_to change(Peep, :count)
  end
end
