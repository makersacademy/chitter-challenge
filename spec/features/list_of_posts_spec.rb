feature 'List of peeps' do
  scenario 'user can see a list of posts' do
    chitter1 = Chitter.create(message: '1st post')
    chitter2 = Chitter.create(message: '2nd post')
    chitter3 = Chitter.create(message: '3rd post')

    visit '/chitter'
    expect(page).to have_content("1st post", chitter1.date)
    expect(page).to have_content("2nd post", chitter2.date)
    expect(page).to have_content("3rd post", chitter3.date)
  end
end
