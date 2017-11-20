feature 'if i dont like a tweet i made' do
  scenario 'i can delete it' do
    sign_up('timmy', 'timmy@hello.com')
    visit '/'
    fill_in('peep', with: 'Hey there!')
    click_button('Peep')
    click_button('delete')
    expect(page).not_to have_content('Hey there!')
    expect(Peep.all.length).to eq 0
  end
end
