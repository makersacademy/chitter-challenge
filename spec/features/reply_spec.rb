
feature 'replying to a peep' do
  scenario 'is possible by the user' do
    sign_up_good
    fill_in 'peep_input', with: 'Hello this is my peep'
    click_button 'Peep'
    fill_in 'reply', with: 'this is a response'
    click_button 'Reply'
    expect(page).to have_content 'this is a response'
  end
end
