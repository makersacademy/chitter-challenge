feature 'peep' do
  scenario 'user can submit a peep' do
    visit '/'
    click_button 'View feed'
    save_and_open_page
    click_on 'Add peep'
    fill_in(:peep, with: 'It is friyay')
    click_button 'Submit'
    expect(page).to have_content('It is friyay')
  end
end