require './../spec_helper'

feature RPS do
  context '/' do
    before do
      visit '/'
    end
    scenario 'sending a peep' do
      fill_in('peep', with: 'First tweet!')
      find_button('Submit').click
  end

  #   it 'can submit the player name' do
  #     find_button('Submit').click
  #   end
  # end
  #
  # context '/play' do
  #   before do
  #     sign_in_and_play
  #   end
  #
  #   it 'says "PLAY"!' do
  #     expect(page).to have_text('PLAY!')
  #   end
  #
  #   it 'can click on rock' do
  #     find_button('Rock').click
  #   end
  #   it 'can click on paper' do
  #     find_button('Paper').click
  #   end
  #   it 'can click on scissors' do
  #     find_button('Scissors').click
  #   end
  #
  #   it 'can click on Spock' do
  #     find_button('Spock').click
  #   end
  #
  #   it 'can click on Lizard' do
  #     find_button('Lizard').click
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
  #   describe 'when I lose' do
  #     before do
  #       allow_any_instance_of(Array).to receive(:sample).and_return('paper')
  #       click_button 'Rock'
  #     end
  #     it 'tells me' do
  #       expect(page).to have_content 'You lose!'
  #     end
  #
  #     it 'reduces my score by 1' do
  #       expect(page).to have_content 'Score: -1'
  #     end
  #   end
  #
  #   describe 'when I tie' do
  #     before do
  #       allow_any_instance_of(Array).to receive(:sample).and_return('rock')
  #       click_button 'Rock'
  #     end
  #
  #     it 'tells me' do
  #       expect(page).to have_content 'You tied!'
  #     end
  #
  #     it 'keeps my score the same' do
  #       expect(page).to have_content 'Score: 0'
  #     end
  #   end
  end
end
