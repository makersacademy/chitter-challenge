feature 'adding a honk' do
  scenario 'user posts a new honk' do
    test_time = '2019-09-15 18:35:27.831561000 +0100'
    allow(Time).to receive(:new) { test_time }
    
    visit('/honks')
    fill_in(:honk_text, with: 'Honkety honk')
    click_button 'Honk!'
    
    expect(page).to have_content('Honkety honk')
    expect(page).to have_content(test_time)
  end
end
    