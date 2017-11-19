feature 'Posting peeps' do
  scenario 'user can post a peep' do
    post_a_peep
    within 'ul#peeps' do
      expect(page).to have_content('blablabla!')
    end
  end

  xscenario 'user can see the time when the peep was created' do
    post_a_peep
    current_time
    within 'ul#peeps' do
      expect(page).to have_content(current_time)
    end
  end

end
