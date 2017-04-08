feature 'Adding hashtags' do
  scenario 'I can add a single hashtag to my peep' do
    create_a_peep
    expect(page).to have_content('first')
  end
end
