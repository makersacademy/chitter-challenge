feature 'Viewing peeps' do

  scenario 'users can see list of peeps on their homepage' do
    Peep.create(message: 'Hi and welcome to Chitter')

    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content 'Hi and welcome to Chitter'

  end

  # scenario 'users can see their name and username as well as their peep' do
  #   sign_up
  #   visit '/peeps'
  #   click_link 'Peep Now'
  #   fill_in 'message', with: 'Hello World'
  #   click_button 'Post Peep'
  #   visit '/peeps'
  #   within '.peeps' do
  #     expect(page).to have_content '@joesweeny Hello World by Joe Sweeny'
  #   end
  # end
end
