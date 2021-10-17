feature 'User can add a peep' do
  scenario 'User should be able to go to the new peep page' do
    visit '/'
    click_button 'Write new Peep'
    expect(page).to have_current_path('/peeps/new?write_peeps=Write+new+Peep')
  end
end
