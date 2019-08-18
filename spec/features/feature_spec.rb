require 'orderly'

feature 'adding a post' do
    scenario 'loading new post page' do
    visit ('/')
    click_button 'New'
    expect(page).to have_content('Submit')
  end

    scenario 'adding post' do
    visit ('/')
    click_button 'New'
    fill_in('msg', with: "test")
    click_button 'Submit'
    expect(page).to have_content('test')
  end
end

feature 'list all posts' do
    scenario 'display posts on mainpage' do
    visit ('/new')
    fill_in('msg', with: "test")
    click_button 'Submit'
    expect(page).to have_content('test')
  end
end

  feature 'Re orders list' do
    scenario 'display posts on mainpage in new order' do
    visit ('/new')
    fill_in('msg', with: "tet")
    click_button 'Submit'
    click_button 'New'
    fill_in('msg', with: "tes434t345")
    click_button 'Submit'
    click_button 'New'
    fill_in('msg', with: "tesffft")
    click_button 'Submit'
    expect("tes434t345").to appear_before("tet")
    end
end
