feature 'Delete a peep' do
  scenario 'user can delete a post' do
    chitter = Chitter.create(message: '1st post')

    visit '/chitter'
    expect(page).to have_content '1st post', chitter.date

    first('.chitter').click_on 'Delete'
    expect(current_path).to eq '/chitter'
    expect(page).not_to have_content '1st post'
  end
end
