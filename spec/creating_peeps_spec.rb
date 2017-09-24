feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'Write a new Peep', with: 'Hello World!'
    click_button 'Peep it!'

    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('Hello World!')
    end
  end
end
