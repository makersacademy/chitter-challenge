feature 'creating peeps' do

  scenario 'I can create peeps' do
    visit '/peeps/new'
    fill_in 'user', with: 'chitty'
    fill_in 'peeps', with: 'This is my first peep'
    click_button 'Peep message'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep')
    end
  end

end