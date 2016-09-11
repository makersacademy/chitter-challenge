feature 'Creating peeps' do

  scenario 'I can let people know what I am doing' do
    visit '/peeps/new'
    sign_up
    click_button 'Create a peep'
    fill_in 'message', with: 'This better work'
    click_button 'Create Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This better work')
    end
  end
end
