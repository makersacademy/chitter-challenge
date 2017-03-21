feature '5: seeing the messages' do
  scenario 'user that is logged in can see all the posted peeps' do

    sign_up
    login

    3.times { post_peep }

    expect( find('ul.posts') ).to have_selector('li', count: 3)

  end
end
