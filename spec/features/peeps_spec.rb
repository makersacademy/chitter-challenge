feature "Viewing Peeps" do

  def sign_in(user)
    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_button 'Sign in'
  end

  def test_peep(peep)
    click_link 'Make peep'
    fill_in :message, with: peep
    click_button 'Peep'
  end

  scenario 'cannot make peeps unless signed in' do
    visit 'peeps/new'
    expect(page).to have_content("Sorry, you can't Peep unless you're a member!")
  end

  scenario 'can make peeps once signed in' do
    user = create(:user)
    visit '/peeps/new'
    click_link 'Sign in'
    sign_in(user)
    test_peep('Test Peep!')
    expect(page.status_code).to eq 200
    expect(page).to have_content('Test Peep!')
  end

  scenario 'can see who made the peep' do
    user = create(:user)
    visit '/peeps'
    click_link 'Sign in'
    sign_in(user)
    test_peep('1')
    expect(page).to have_content('anon1')
  end

  scenario 'peeps appear in reverse chronological order' do
    user = create(:user)
    peep1 = user.peepss.create(message: 'First')
    sleep 1.0
    peep2 = user.peepss.create(message: 'Second')
    visit '/'
    expect(page).to have_content("Second #{peep2.created_at.strftime('%d/%m/%Y %H:%M:%S')} Reply anon1 peeps: First #{(peep1.created_at).strftime('%d/%m/%Y %H:%M:%S')}")
  end

end
