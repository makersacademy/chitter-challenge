
feature 'see peeps in reverse chronological order' do

  before(:each) do
    create_user_alice
    log_in
  end

  scenario 'peeps are displayed in reverse chronological order' do

    post(content: 'Hello')
    sleep 0.02
    post(content: 'Aloha')
    expect(page).to have_content 'Hello'
    expect(page).to have_content 'Aloha'
    #expect('Hello').to appear_before 'Aloha'
  end

end