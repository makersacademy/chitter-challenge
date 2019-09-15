feature 'adding a honk' do
  scenario 'user posts a new honk' do
    
    visit('/honks')
    fill_in(:honk_text, with: 'Honkety honk')
    click_button 'Honk!'
    
    expect(page).to have_content('Honkety honk')
  end
end
    