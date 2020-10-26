feature 'Create Peep' do
  scenario 'a user can create a peep' do 
    sign_in_and_peep
    expect(page).to have_content "THE BEST PEEP EVER!\n-Peepz4Dayz"
  end
end
