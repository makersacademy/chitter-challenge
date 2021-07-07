require 'pg'

feature 'post a peep' do
  scenario 'user can post a message' do
    visit '/new'
    fill_in('peep', with: 'My first peep!')
    click_button 'chirp'
    expect(page).to have_content 'My first peep!' and '@indisaurusrex'
  end

  scenario 'message shown is dynamic' do
    visit '/new'
    fill_in('peep', with: 'My first peep!')
    click_button 'chirp'
    expect(page).not_to have_content 'My first peep!'
  end
end