require 'pg'

feature 'Viewing posts' do
    scenario 'A user can view posts' do
      visit('/posts')

      expect(page).to have_content "Anyone trying to get into coding should check out makersacademy.com"
      expect(page).to have_content "Top 10 tracks and videos of all time https://www.youtube.com/watch?v=HldHtBxNK6k"
      expect(page).to have_content "Anyone got any good otter pics?"
    end
  end