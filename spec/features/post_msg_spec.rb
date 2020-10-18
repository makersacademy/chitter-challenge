feature 'adding messages on chitter' do
  scenario 'adding a peep' do
    visit '/new'
    fill_in('message', with: 'this is my first peep to say i am writing a feature test')
    click_button('Submit')
    expect(page).to have_content "this is my first peep to say i am writing a feature test"
  end
end
