feature 'Displaying peeps' do
  scenario 'user posts a peep which is displayed' do
    visit '/'
    fill_in 'peep', with: 'My first peep'
    click_on 'Peep'
    expect(page).to have_content 'My first peep'
  end
end