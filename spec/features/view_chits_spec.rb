feature 'View chits' do
  let(:user) { User.create(username: 'Tester',
                           email: 'test@mail.com',
                           password: 'password')
  }
  scenario 'I can see a list of all the chits' do
    sign_up
    post_a_chit('some random text')
    expect(current_path).to eq '/chits'
    expect(page).to have_content 'some random text'
  end

  scenario 'Chits have a relative time-stamp in words' do
    sign_up
    post_a_chit('some random text')
    expect(page.find('#chits .panel .panel-footer')).to have_content 'just now'
  end

  scenario 'I can see the chits in reversed chronological order' do
    Chit.create(user_id: user.id, message: 'first',  time: Time.now + 0)
    Chit.create(user_id: user.id, message: 'second', time: Time.now + 5)
    Chit.create(user_id: user.id, message: 'third',  time: Time.now + 10)
    visit '/chits'
    expect(page.find('#chits .panel:first-child .panel-body')).to have_content 'third'
  end
end
