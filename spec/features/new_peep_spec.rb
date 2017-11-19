feature 'Create Peep:' do
  scenario 'A user can create a new Peep message' do
    create_account('Test', 'mrtest', 'test@test.uk', 'Testing')
    write_new_peep('hello world')
    expect(Peep.all.length).to eq(1)
    expect(page.current_url.ends_in?('/peeps')).to be(true)
    expect(page).to have_content('hello world')
    expect(page).to have_content('mrtest')
  end

  scenario "A user can't view the new peeps page unless they are signed in" do
    visit('/peeps/new')
    expect(page.current_url).not_to include('/peeps/new')
    create_account('Test', 'mrtest', 'test@test.uk', 'Testing')
    visit('/peeps/new')
    expect(page.current_url).to include('/peeps/new')
  end

  scenario 'A Peep is linked to the user who created it' do
    create_account('Test', 'mrtest', 'test@test.uk', 'Testing')
    test_user = User.all.last
    expect(test_user.peep).to be_empty
    write_new_peep('hello world')
  end
end
