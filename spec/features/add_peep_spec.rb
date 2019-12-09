feature 'Add peep' do
  scenario 'Should add a peep and show the peep in the list' do
    visit('/')
    sign_in
    click_on 'new_peep'
    fill_in 'content', with: 'this is a peep'
    click_on 'submit_peep'
    expect(page).to have_content 'abacon'
    expect(page).to have_content 'this is a peep'
  end
end