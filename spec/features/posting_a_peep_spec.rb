feature 'Posting peeps' do
  scenario 'A user can post a peep' do
    sign_up_and_go_to_homepage
    
    fill_in 'text', with: 'Test peep'
    click_button 'Peep!'

    expect(page).to have_content 'Test peep'
  end
end
