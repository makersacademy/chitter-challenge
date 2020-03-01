feature 'deleting peeps' do
  scenario 'user deletes a peep' do
    sign_up 
    add_peep

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content 'My first peep'
  end
end