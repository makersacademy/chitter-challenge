feature 'able to add peep' do
  scenario 'when logged in' do
    visit('/main')
    add_peep('this is my first peep')
    expect(page).to have_content('this is my first peep')
  end
end
