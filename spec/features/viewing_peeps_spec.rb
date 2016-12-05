feature 'Viewing peeps' do

  scenario 'anyone can see the peeps' do
    sign_up
    click_button 'New peep'
    content = "Test content. Test content. Test content."
    fill_in :content, with: content
    click_button 'Post'
    click_button 'Sign out'
    expect(page).to have_content(content)
  end

  scenario 'new peeps are above old peeps' do
    user = User.create(name: 'John Smith',
                email: 'jsmith@gmail.com',
                username: 'jsmith2016',
                password: 'pizza123!',
                password_confirmation: 'pizza123!')

    old_peep = Peep.create(content: "Old", :user => user)
    sign_in(username: 'jsmith2016', password: 'pizza123!')
    new_peep = Peep.create(content: "New", :user => user)
    visit '/peeps'
    expect("New").to appear_before("Old")
  end

end
