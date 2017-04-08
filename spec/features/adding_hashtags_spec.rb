feature 'Adding hashtags' do
  scenario 'I can add a single hashtag to my peep' do
    create_a_peep
    expect(page).to have_content('first')
  end

  scenario 'I can add multiple hashtags to my peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'A peep with multiple hashtags'
    fill_in 'hashtags', with: 'gaming, fakenews'
    click_button 'Post Peep!'

    visit '/hashtags/gaming'
    expect(page).to have_content('A peep with multiple hashtags')
    visit '/hashtags/fakenews'
    expect(page).to have_content('A peep with multiple hashtags')
  end
end
