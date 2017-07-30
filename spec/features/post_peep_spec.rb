require_relative 'web_helper'
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'Posting peeps' do

  scenario 'user can post peeps' do
    visit '/'
    expect(page.status_code).to eq 200
    click_button 'Post Peep'
    expect(current_path).to eq '/peeps'
    fill_in 'peeps', with: 'Hello World!'
    click_button 'Peep'
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content 'Hello World!'
    end
  end
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
  scenario 'peeps appear in reverse chronological order' do
    visit '/'
    expect(page.status_code).to eq 200
    click_button 'Post Peep'
    expect(current_path).to eq '/peeps'
    fill_in 'peeps', with: 'Hello World!'
    click_button 'Peep'
    fill_in 'peeps', with: 'Beautiful day!'
    click_button 'Peep'

    within 'ul#peeps' do
      expect(page.find('li:nth-child(1)')).to have_content 'Beautiful day!'
      expect(page.find('li:nth-child(1)')).not_to have_content 'Hello World!'
    end
  end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made
  scenario 'peeps appear with time at which posted' do
    visit '/'
    expect(page.status_code).to eq 200
    click_button 'Post Peep'
    expect(current_path).to eq '/peeps'
    fill_in 'peeps', with: 'Hello World!'
    click_button 'Peep'
    fill_in 'peeps', with: 'Beautiful day!'
    click_button 'Peep'

    within 'ul#peeps' do
      expect(page.find('li:nth-child(1)')).to have_content time
    end
  end
end
