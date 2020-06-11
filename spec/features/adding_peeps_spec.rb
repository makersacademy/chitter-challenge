feature 'Adding a new peep' do
  scenario 'A user can add a peep to the chitter feed' do
    visit('/')
    click_on 'New Peep'
    fill_in('content', with: 'my bonnie lies over the ocean')
    click_button('Peep')

    expect(current_path).to eq '/'
    expect(page).to have_content 'my bonnie lies over the ocean'
  end
end
