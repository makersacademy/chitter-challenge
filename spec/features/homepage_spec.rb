feature 'Homepage' do
  scenario 'Homepage displays Chitter name' do
    visit '/'
    expect(page).to have_content 'Welcome to Chitter'
  end

  scenario 'Homepage has view peeps button' do
    visit '/'
    expect(page).to have_content 'View Peeps'
  end

  scenario 'Homepage has write a peep button' do
    visit '/'
    expect(page).to have_content 'Write a Peep'
  end
end
