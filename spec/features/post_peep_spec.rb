feature 'posting peep' do 
  scenario 'should be able to post peep' do 
    visit '/'
    click_button "Post Peep"
    fill_in 'name', with: 'test name'
    fill_in 'email', with: 'test@email.com'
    fill_in 'peep', with: 'this is a test peep'
    click_button "Post"
    expect(page).to have_content 'this is a test peep'
  end 
end 