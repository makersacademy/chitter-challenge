feature 'Creating peeps' do 

  scenario 'I can create a new peeps' do
    visit '/peeps/new'
    fill_in 'activity', with: 'Eating dinner with friends'
    click_button 'Peep it!'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do 
      expect(page).to have_content('Eating dinner with friends')
    end
  end
end
    
