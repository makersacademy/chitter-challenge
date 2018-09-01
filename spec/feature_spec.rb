feature 'homepage' do
  
  scenario 'should have input box for message' do
    visit '/'
    expect(page).to have_content 'Enter your message'
  end

  scenario 'message is input and appears on the page' do
    visit '/'
    fill_in 'content', with: 'Hello world'
    click_on 'submit'
    expect(page).to have_content 'Hello world'
  end
end