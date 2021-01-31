feature 'Delete peep' do 
  scenario 'removes a peep from the feed' do 
    create_new_user_and_write_a_peep
    expect(page).to have_content "Hello this is a peep"
    expect(current_path).to eq '/feed'

    first('.peep').click_button('Delete')

    expect(current_path).to eq '/feed'
    expect(page).not_to have_content "Hello this is a peep"
  end
end