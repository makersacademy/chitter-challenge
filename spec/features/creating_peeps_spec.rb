feature 'Create Peep' do
  scenario 'write peep and view peep in feed' do
    sign_up
    visit '/peeps/new'
    fill_in :comment, with: 'example'
    click_button 'Create peep'
    expect(page).to have_content('example')
  end
end
