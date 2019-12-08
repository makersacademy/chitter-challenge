feature 'Edit a peep' do
  scenario 'user can update a message from chitter' do
    chitter = Chitter.create(message: '1st post')
    visit('/chitter')
    expect(page).to have_content '1st post', chitter.date

    first('.chitter').click_on 'Edit'
    expect(current_path).to eq "/chitter/#{chitter.id}/edit"

    fill_in 'message', with: "2nd post"
    click_on 'Submit'

    expect(current_path).to eq '/chitter'
    expect(page).not_to have_content '1st post'
    expect(page).to have_content '2nd post', chitter.date
  end
end
