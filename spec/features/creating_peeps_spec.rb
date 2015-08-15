feature 'creating peeps' do

  scenario 'I can create peeps' do
    visit '/peeps/new_peeps'
    fill_in 'user', with: 'chitty'
    fill_in 'peeps', with: 'This is my first peep'
    click_button 'Peep message'
    expect(current_path).to eq '/peeps'
    within 'ul#links' do
      expect(page).to have content('This is my first peep')
    end
  end
end