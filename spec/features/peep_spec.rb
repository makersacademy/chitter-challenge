feature 'Peep' do

  let!(:user) { User.create(email: 'johndoe@internet.com', name: 'John Doe', username: 'johndoe', password: 'test', password_confirmation: 'test') }

  scenario 'via a new peep page' do
    sign_in(email: user.email, password: user.password)
    visit '/peeps/new'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Peep here:'
    expect(page).to have_button 'Peep'
  end

  scenario 'and see the peep on a peep list page' do
    sign_in(email: user.email, password: user.password)
    visit '/peeps/new'
    fill_in :content, with: 'This is my first peep!'
    click_button 'Peep'
    expect(page).to have_content "#{user.name}"
    expect(page).to have_content "#{user.username}"
    expect(page).to have_content 'This is my first peep!'
  end

  scenario 'that the public can also see' do
    sign_in(email: user.email, password: user.password)
    visit '/peeps/new'
    fill_in :content, with: 'Anyone can see this peep!'
    click_button 'Peep'
    click_button 'Sign out'
    visit '/johndoe'
    expect(page.status_code).to eq 200
    expect(page).to have_content "#{user.name}"
    expect(page).to have_content "#{user.username}"
    expect(page).to have_content 'Anyone can see this peep!'
  end
end
