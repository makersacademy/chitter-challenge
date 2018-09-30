feature 'The user can post a peep' do
  scenario 'from the home page, once signed in' do
    log_in_as_billy
    fill_in 'peep_text', with: 'Testing peep entry'
    click_button 'Post peep'
    expect(page).to have_content 'Testing peep entry'
    expect(page).to have_content 'Peeped by billy1'
    log_out_of_page
  end
end
