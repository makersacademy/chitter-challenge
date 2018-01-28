feature 'Creating peeps' do
  scenario 'Attempt to peep when not logged in' do
    visit '/peeps/new'
    expect(page).to have_content('Please sign in')
    expect(current_path).to eq('/sessions/new')
  end

  scenario 'Add a new peep when logged' do
    expect { sign_up }.to change(User, :count)
    visit '/peeps/new'
    fill_in 'message', with: 'My first peep'
    click_button 'Add'
    expect(page).to have_content('@Bob')
    expect(page).to have_content('My first peep')
  end


end
