feature 'adding peeps' do
  scenario 'I can add peeps to chitter' do
    user_sign_up
    visit '/'
    fill_in :text, with: 'This is my First peep'
    click_button 'Add peep'
    expect(page).to have_content 'Peep added to Chitter'
  end
end
