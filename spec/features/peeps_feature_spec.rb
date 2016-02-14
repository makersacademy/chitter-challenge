require 'spec_helper'
require 'timecop'

feature 'Public Peeps' do

  scenario 'Users can post a peep to the chitter homepage' do
    post_peep
    expect(page).to have_content 'Here\'s Johny'
  end

  scenario 'Users can see everyons\'s in reverse chronological order' do
    post_peep
    post_peep_2
    expect('Another futile peep').to appear_before 'Here\'s Johny'
  end


  context 'Date and timestamping peeps'do
    before do
      Timecop.freeze(Time.local(1990))
    end

    after do
      Timecop.return
    end


    scenario 'Users can see what date and time peeps were posted and who by' do
      post_peep
      expect(page).to have_content '12:00AM'
      expect(page).to have_content '01/01/1990'
      expect(page).to have_content 'Le Jockey'
    end

  end

  context 'Invalid peeps' do

    scenario 'If there is no user logged in you cannot peep' do
      post_peep_no_author
      expect(page).to have_content 'This is a members only cult. IMPOSTER'
      expect(page).not_to have_content 'Here\'s Johny'
      expect{post_peep_no_author}.not_to change(Peep, :count)
    end

    scenario 'Peeps have a limit of 140 characters' do
      post_peep_long
      expect(page).to have_content 'Keep it brief'
      expect(page).not_to have_content 'Too long for Hound. Hound is crying'
      expect{post_peep_long}.not_to change(Peep, :count)
    end
  end
end
