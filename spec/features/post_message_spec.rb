feature 'New peep' do 
  scenario 'create a new post and see it on the page' do 
    create_new_user_and_write_a_peep
    expect(page).to have_content "Hello this is a peep"
  end
end
