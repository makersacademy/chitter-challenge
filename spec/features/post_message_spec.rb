feature 'Create post' do

  before do
    new_post
  end

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter
  scenario 'can post a message' do
    within 'ul#post' do
      expect(page).to have_content('Hello World!')
    end
  end
end
