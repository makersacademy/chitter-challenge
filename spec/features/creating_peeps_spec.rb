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

  scenario 'Add a 2 new peeps, ensure they\'re in the correct order' do
    expect { sign_up }.to change(User, :count)
    [1,2,3,4,5].each do |n|
      visit '/peeps/new'
      Timecop.freeze(Time.local(2008, 9, 1, 12, 0, n))
      fill_in 'message', with: "Peep #{n}"
      click_button 'Add'
    end
    expect('Peep 5').to appear_before('Peep 4')
    expect('Peep 4').to appear_before('Peep 3')
    expect('Peep 3').to appear_before('Peep 2')
    expect('Peep 2').to appear_before('Peep 1')
  end
end
