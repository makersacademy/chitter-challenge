feature 'user can add a tweet to the timeline' do
  scenario 'a tweet is added to the timeline' do
   visit('/tweets')
   expect(page).to have_content('Tweet')

  #  fill_in('tweet', with: 'Owls in your gravy!?')
  #  click_button('Tweet')
  #  expect(page).to have_content('Owls in your gravy!?')

  end
end

