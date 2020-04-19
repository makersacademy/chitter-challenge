feature 'deleting peeps' do
  scenario 'which belong to user' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password') 
    add_peep

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content 'My first peep'
  end

  scenario 'disabled for peeps created by another user' do
    other_user_adds_peep
    sign_up_alt

    expect(first('.peep')).not_to have_selector(:link_or_button, 'Delete')
  end

  scenario 'disabled when logged out' do
    sign_up('Peter Pan', 'peterpan', 'peter@neverland.com', 'password')
    add_peep
    click_on :'Log Out'
    visit '/peeps'

    expect(first('.peep')).not_to have_selector(:link_or_button, 'Delete')
  end
end
