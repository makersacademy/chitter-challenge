feature 'deleting peeps' do
  scenario 'user deletes a peep' do
    Peep.create(body: 'My first peep', username: 'lookupdaily')
    visit '/'

    first('.peep').click_button 'Delete'

    expect(current_path).to eq '/'
    expect(page).not_to have_content 'My first peep'
  end
end