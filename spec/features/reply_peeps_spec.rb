feature 'reply to peeps' do

  let(:user1) do
    user = User.create(email: 'coco@gmail.com',
                  password: 'lila',
                  password_confirmation: 'lila',
                  name: 'Julien',
                  user_name: 'coco')
  end

  let(:user2) do
    user = User.create(email: 'cocoa@gmail.com',
                  password: 'lili',
                  password_confirmation: 'lili',
                  name: 'Alix',
                  user_name: 'cocoa')
  end

  scenario 'as signed in user' do
    create_peep(email: user1.email,password: user1.password,content: 'test1')
    sign_in(email: 'cocoa@gmail.com', password:'lili')
    visit('/peeps')
    click_button 'Reply'
    fill_in :content, with: "test2"
    click_button 'Post reply'
    expect(page).to have_content("test2")
  end
end
