
feature 'Creating chits' do

  scenario 'I can post a new chit' do
    visit '/chits/new'
    fill_in 'user',   with: 'Ninja'
    fill_in 'chitter_post', with: 'ZEF TO DEF'
    click_button 'Post Chit'

    expect(current_path).to eq '/chits'

      within 'ul#posts' do
      expect(page).to have_content('ZEF TO DEF')
    end
  end
end