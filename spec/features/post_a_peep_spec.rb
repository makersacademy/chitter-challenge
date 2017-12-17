feature 'Post a peep' do
  scenario 'can post a single peep' do
    peep_post_1
    within 'ul#peeps' do
      expect(page).to have_content('first peep')
    end
  end
end
