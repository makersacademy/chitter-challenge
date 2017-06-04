feature 'Posting peeps' do
  scenario 'users can post a peep to Chitter' do
    sign_up('@codey_mc_code_face')
    login('@codey_mc_code_face')
    post_peep
    within 'ul#peeps' do
      expect(page).to have_content('OMG! Makers weekend challenges r so cool?!!')
    end
    DatabaseCleaner.clean
  end
end
