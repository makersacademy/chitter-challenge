feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    sign_up
    fill_in('peep', with: 'Hello World')
    click_button('Post')
  
    expect(page).to have_content 'Hello World'
  end
end
