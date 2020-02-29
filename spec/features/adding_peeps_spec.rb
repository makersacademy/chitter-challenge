feature 'adding peeps' do
  scenario 'user adds peep' do
    visit '/peeps'
    fill_in 'username', with: 'lookupdaily'
    fill_in 'body', with: 'My first peep'
    click_on 'Peep' 

    expect(page).to have_content "My first peep" 
  end
end
