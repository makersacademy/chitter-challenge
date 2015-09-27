feature 'Creating peeps' do 

  scenario 'I can create a new peep' do 
    visit '/feed/new'
    fill_in 'message', with: 'hello'
    click_button 'Peep'
    expect(current_path).to eq '/feed'
    within 'ul#peeps' do 
      expect(page).to have_content('hello')
    end 
  end

  scenario 'I can only peep if I am logged in' do 
    visit '/feed'
    expect(page).not_to have_button('New peep')
  end



end