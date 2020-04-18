feature 'viewing peeps' do
  scenario 'user visits app' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    add_peep
    visit '/peeps'
    expect(page).to have_content "My first peep" 
  end
end
