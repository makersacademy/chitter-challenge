feature 'Creating a Peep' do
  scenario 'User creates new Peep' do
    new_peep('Test peep')
    expect(page).to have_content('Test peep')
  end

  scenario 'User cancels new Peep' do
    cancelled_peep
    expect(page).to_not have_content('Test peep')
  end
end

feature 'Printing peeps' do
  scenario 'Peeps are printed in reverse order' do
    new_peep('Peep 1')
    new_peep('Peep 2')
    expect(page).to have_content('Peep 1')
    expect(page).to have_content('Peep 2')
    expect('Peep 2').to appear_before('Peep 1')
  end

  scenario 'Peeps are printed whith no user signed in' do
    new_peep('Peep 1')
    new_peep('Peep 2')
    sign_out
    visit 'user/user'
    expect(page).to have_content('Peep 1')
    expect(page).to have_content('Peep 2')
    expect('Peep 2').to appear_before('Peep 1')
  end
end
