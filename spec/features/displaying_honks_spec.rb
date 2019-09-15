feature 'adding a honk' do
  scenario 'user posts a new honk' do
    
    visit('/honks')
    fill_in(:honk_text, with: 'Honkety honk')
    click_button 'Honk!'
    
    expect(page).to have_content('Honkety honk')
    # expect(page).to have_content('2019-09-15 17:36:58')
  end
end
    