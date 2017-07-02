feature 'Post message' do
  scenario 'Post a peep on Chitter' do
    visit('/peeps')
    click_button('New Peep')
    fill_in 'peep_content', with: 'This is my first peep'
    click_button('Peep')
    expect(current_path).to eq('/peeps')
    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep')
    end
  end
end
