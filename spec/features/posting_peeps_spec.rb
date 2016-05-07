feature 'Posting peeps' do

  scenario 'I can post a new peep' do
    visit '/peeps/post'
    fill_in 'body',   with: 'I like peeping!'
    click_button 'Post peep!'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('I like peeping!')
    end
  end
end
