feature 'Posting peeps' do
  scenario 'users can post a peep to Chitter' do
    post_peep
    within 'ul#peeps' do
      expect(page).to have_content('OMG! Makers weekend challenges r so cool?!!')
    end
    DatabaseCleaner.clean
  end
end
