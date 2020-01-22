feature 'See time of peep creation' do
  scenario 'A user can see the time at which peep was created' do
    visit '/peeps/new'
    fill_in('message',with: '11:38am Peep')
    click_button('Submit')

    expect(first('#message')).to have_content "11:38"
  end
end
