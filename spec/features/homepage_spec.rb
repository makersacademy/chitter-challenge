feature 'Home page' do
  scenario 'has a feild to write a peep' do
    visit_and_add_peep('my first peep')

    expect(current_path).to eq('/chitter')
  end

  scenario 'shows all the peeps newest first' do
    visit_and_add_peep('my first peep')
    expect(page).to have_content('my first peep')
    visit_and_add_peep('my second peep')

    expect(page).to have_content('my second peep')
  end
end
