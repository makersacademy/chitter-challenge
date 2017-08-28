feature 'You can create users' do

  scenario 'username fields' do
    visit('/users/new')
    expect(page).to have_field("username")
    expect(page).to have_field("password")
    expect(page).to have_field("email")
  end

  # scenario 'user added' do
  #   User.create(username: 'FreddieCodes', name: 'Freddie', email: "Freddie@MakersAcademy.com")
  #   visit('/user/new')
  # end

  #
  # scenario 'Tags work' do
  # 	visit '/links/new'
  # 	fill_in("url", with: "http://www.google.co.uk")
  # 	fill_in("title", with: "Google")
  #   fill_in("tag", with: "Sports")
  # 	click_button("Add")
  #   link = Link.first
  #   expect(link.tags.map(&:name)).to include('Sports')
  #   end

end
