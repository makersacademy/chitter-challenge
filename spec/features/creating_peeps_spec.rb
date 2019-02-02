feature 'Creating Peeps:' do
  scenario '- user can create a peep on the Chitter feed' do
    visit ('/posts')
    fill_in 'peep_box', with: 'This is a test peep'
    click_button 'Peep!'
    expect(page).to have_content 'This is a test peep'
  end
end
