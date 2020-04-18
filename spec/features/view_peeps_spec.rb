feature 'viewing peeps' do
  scenario 'can view without logging in' do
    other_user_adds_peep
    click_on 'Chitter'
    
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "My first peep" 
  end

  scenario 'add peep form is hidden to non-logged in user' do
    visit '/peeps'
    expect(page).not_to have_field 'body' 
  end
end
