feature 'user can add a peep and see it on chitter' do
  scenario 'user adds peep' do
    visit('/')
    click_link('New Peep')
    fill_in 'content', with: 'Ed Balls'
    click_button('Submit')
    expect(page).to have_content('Ed Balls')   
  end
end
