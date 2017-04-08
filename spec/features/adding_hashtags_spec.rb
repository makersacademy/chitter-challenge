feature 'Adding hashtags' do
  scenario 'I can add a single hashtag to my peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'A tweet with a hashtag'
    fill_in 'hashtags', with: '#first'
    click_button 'Post Peep!'

    expect(page).to have_content('#first')
  end
end
