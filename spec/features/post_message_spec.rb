# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Post a message as user' do

  # As a user
  # So that I can post a message
  # I want to be shown to the page to compose a message
  scenario 'I want to see the invitation to compose a message' do
    visit '/message/new'
    expect(page).to have_content 'Compose a new peep'
  end

  # As a user
  # So that I can post a message
  # I want to compose a message and see it on my feed 
  scenario 'I want to compose a message and see it on my feed' do
    expect { peep }.to change { Peep.count }.by(1)
    within('div#peep-feed') do
      expect(page).to have_content 'My first peep'
    end
  end
end
