feature 'Posting Chits' do

  scenario 'I can post a new chit' do
    visit '/chits/new'
    fill_in 'post', with: "I'm amazing"
    click_button 'Post chit'

    expect(current_path).to eq '/chits'

    within 'ul#chits' do
      expect(page).to have_content("I'm amazing")
    end
  end
end
