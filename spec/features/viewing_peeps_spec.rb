require_relative '../../app/data_mapper_setup'

feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peep feed' do
    user = create :user
    Peep.create(message: 'test', username: user.username,
                name: user.name, time: Time.now)
    visit '/feed'
    expect(page.status_code).to eq 200
    within 'ul#feed' do
      expect(page).to have_content('test')
    end
  end

  scenario 'Each peep displays the name of the user who wrote it' do
    user = create :user
    Peep.create(message: 'test', username: user.username,
                name: user.name, time: Time.now)
    visit '/feed'
    within 'ul#feed' do
      expect(page).to have_content('Alice Example')
      expect(page).to have_content('alice')
    end
  end

  # scenario 'I can filter peeps by user' do
  #   user = create :user
  #   Peep.create(message: 'test', username: user.username, name: user.name, time: Time.now)
  #   Peep.create(message: 'test', username: 'emily', name: 'Emily Worrall', time: Time.now)
  #   visit '/feed/alice'
  #   within 'ul#feed' do
  #     expect(page).not_to have_content('emily')
  #     expect(page).to have_content('alice')
  #   end
  # end

end
