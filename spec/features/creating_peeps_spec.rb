feature 'Creating Peeps:' do
  scenario '- user can create a peep on the Chitter feed' do
    visit ('/chitter')
    fill_in 'message', with: 'This is a test peep'
    fill_in 'name', with: 'Jane'
    click_button 'Peep!'
    expect(page).to have_content 'This is a test peep'
    expect(page).to have_content 'Jane'
  end
end
