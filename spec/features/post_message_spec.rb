feature 'Post message' do
  scenario 'Post a peep on Chitter' do
    visit('/peeps/new')
    fill_in 'new_peep', with: 'This is my first peep'
    click_button('Peep')
    expect(current_path).to eq('/peeps')
    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep')
    end
  end
end
