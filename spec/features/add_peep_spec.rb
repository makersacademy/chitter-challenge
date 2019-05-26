feature 'post message' do

  scenario 'checks that user can post a message on chitter' do

    visit '/'

    click_button 'Peep'

    fill_in 'message', with: 'hello! welcome to chitter'

    click_button 'Post Peep'

    expect(page). to have_content('hello! welcome to chitter')
   
  end
  
end