feature 'viewing peeps' do
  scenario 'user visits app' do
    sign_up
    add_peep
    visit '/peeps'
    expect(page).to have_content "My first peep" 
  end
end
