require_relative './../../models/peep'

feature Chitter do

  context '/' do
    scenario 'sign into Chitter' do
      login_user
      expect(page).to have_text('Logged in as: jellybean454')
    end

  end


  context '/new' do
    before do
      visit '/new'
    end
    scenario 'it can send a peep' do
      fill_in('new_peep', with: 'First peep!')
      find_button('Submit').click
    end
  end

  context '/peeps' do
    scenario 'show peeps in reverse chronological order' do
      new_peep
      other_peep
      within 'ul#peeplist' do
        expect(page).to have_text('First peep!')
        expect(page).to have_text('Second peep!')
      end
    end

    it 'shows the tweet time' do
      peep1 = Peep.create(content: 'Testing time')
      peep2 = Peep.create(content: 'Testing time 2')
      visit '/peeps'
      within  'ul#peeplist' do
        expect(page).to have_text(peep1.created_at)
        expect(page).to have_text(peep2.created_at)
      end
    end

    scenario 'peeps posted by users' do
      login_user
      new_peep
      expect(page).to have_text('jellybean454: First peep!')
    end

    it 'shows current user when logged in' do
      login_user
      expect(page).to have_text('Logged in as: jellybean454')
    end

    it 'does not show current user when not logged in' do
      visit '/peeps'
      expect(page).to_not have_text('Logged in as: jellybean454')
    end
  end

  #   it 'can submit the player name' do
  #     find_button('Submit').click
  #   end
  # end
  #
  # context '/outcome' do
  #   before do
  #     sign_in_and_play
  #   end
  #
  #   it 'tells you the outcome' do
  #     sign_in_and_play
  #     click_button 'Scissors'
  #     expect(page).to have_current_path('/outcome')
  #   end
  #
  #   it 'tells you what the computer chose' do
  #     sign_in_and_play
  #     click_button 'Scissors'
  #     expect(page).to have_text('Computer chose')
  #   end
  #
  #   it 'allows you to keep playing' do
  #     sign_in_and_play
  #     click_button 'Scissors'
  #     find_button('Scissors').click
  #   end
  #
  #   it 'keeps track of scores' do
  #     sign_in_and_play
  #     click_button 'Scissors'
  #     expect(page).to have_text('Score:')
  #   end
  #
  #   describe 'When I win' do
  #     before do
  #       allow_any_instance_of(Array).to receive(:sample).and_return('scissors')
  #       click_button 'Rock'
  #     end
  #
  #     it 'tells me' do
  #       expect(page).to have_content 'You win!'
  #     end
  #
  #     it 'adds to my score' do
  #       expect(page).to have_content 'Score: 1'
  #       expect(page).to_not have_content 'Score: 0'
  #     end
  #
  #     it 'keeps adding to my score' do
  #       click_button 'Rock'
  #       expect(page).to have_content 'Score: 2'
  #       expect(page).to_not have_content 'Score: 1'
  #     end
  #   end

  #
  #   describe 'when I tie' do
  #     before do
  #       allow_any_instance_of(Array).to receive(:sample).and_return('rock')
  #       click_button 'Rock'
  #     end

end
