feature 'delete peep' do 
  scenario 'removes a peep from the feed' do 
    Peep.create(message: "Hello this is a peep", time_last_altered: Time.now)
    visit('/feed')
    expect(page).to have_content "Hello this is a peep"

    first('.peep').click_button('Delete')

    expect(current_path).to eq '/feed'
    expect(page).not_to have_content "Hello this is a peep"
  end
end