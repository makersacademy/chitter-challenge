require 'spec_helper'

feature 'Posting Peeps' do
  context 'when user is logged in' do
    # scenario 'user can post a message' do
    #   visit '/posts/new'
    #   fill_in :peep, with: "Any kind of message to test this shit"
    #   click_button 'Post Peep'
    #   expect(current_path).to eq '/posts'
    #   expect(page).to have_content 'Any kind of message to test this shit'
    # end
      # within 'ul#links' do
    #   expect(page).to have_content('This is Zombocom')
    # end
  end
    context 'when user is not logged in' do
      scenario 'user cannot post a message' do
      end

      scenario 'user can see messages' do

      end
    end
end