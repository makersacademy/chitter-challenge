feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the index page' do
    user = build :user
    sign_up(user)
    click_button 'Peep'
    fill_in 'message', with: 'today is saturday'
    click_button 'Post peep'
    visit '/'
    # save_and_open_page
    expect(page).to have_content('today is saturday')
  end

  scenario 'Peeps display the username of poster' do
    user = build :user
    sign_up(user)
    click_button 'Peep'
    fill_in 'message', with: 'today is saturday'
    click_button 'Post peep'
    expect(current_path).to eq '/'
    expect(page).to have_content('foooo')
  end
end

feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    user = build :user
    sign_up(user)
    click_button 'Peep'
    fill_in 'message', with: 'today is saturday'
    click_button 'Post peep'
    expect(current_path).to eq '/'
    expect(page).to have_content('today is saturday')
  end

  scenario 'Only members can post peeps' do
    visit '/peep/new'
    expect(page).to have_content('You must sign up')
  end
end


feature 'Filtering peeps' do
  before(:each) do
    user = create :user
    user.peeps.create(message: 'http://www.makersacademy.com',
                tags: [Tag.first_or_create(name: 'education')])
    user.peeps.create(message: 'hello how are you',
                tags: [Tag.first_or_create(name: 'education')])
  end

  scenario 'I can filter peeps by tag' do
    visit '/tags/education'
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('makersacademy')
      expect(page).to have_content('how are you')
  end
end
