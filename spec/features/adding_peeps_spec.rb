feature 'adding peeps' do
  scenario 'signed in user adds peep' do
    sign_up
    visit '/peeps'
    fill_in 'body', with: 'My first peep'
    click_on 'Peep' 

    expect(page).to have_content "My first peep" 
    expect(first('.peep')).to have_content "peterpan"
    expect(first('.peep')).to have_content "Peter Pan"
  end
end
