feature 'Adding a new chitter' do
  scenario 'A user can add a message to chitter' do
    visit('/chitter/new')
    fill_in('message', with: '1st post')
    click_button('Submit')

    expect(page).to have_content '1st post'
  end
end