require 'time'
feature 'Chitter website functions' do
  scenario 'web site test' do
    visit('/')
    expect(page).to have_content('Chitter')
  end

  scenario 'post a peep' do
    visit('/')
    fill_in('peep', with: 'This is a peep')
    click_button('Submit')
    expect(current_path).to eq('/')
    expect(first('.peep')).to have_content('This is a peep')
  end

  scenario 'reverse chrono order' do
    visit('/')
    fill_in('peep', with: 'I washed my car')
    click_button('Submit')
    fill_in('peep', with: 'I polished my car')
    click_button('Submit')
    fill_in('peep', with: 'I hoovered my car')
    click_button('Submit')
    expect(current_path).to eq('/')
    expect(first('.peep')).to have_content('I hoovered my car')
  end

  scenario 'timestamp is shown' do
    time = Time.now
    day = time.strftime("%d")
    visit('/')
    fill_in('peep', with: 'I washed my car')
    click_button('Submit')
    expect(current_path).to eq('/')
    expect(first('.peep')).to have_content("#{day}")
  end

  scenario 'user sign up to chitter' do
    visit('/')
    expect(page).to have_link('Sign up', href: '/users/new')
    click_on('Sign up')
    expect(current_path).to eq('/users/new')
    fill_in('email', with: 'test@email.com')
    fill_in('password', with: 'password123')
    click_button('Submit')
    expect(page).to have_content('Hi, test@email.com')
  end
end