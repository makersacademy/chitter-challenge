def peep_post_1
  visit('/peeps/post')
  fill_in 'title', with: '1'
  fill_in 'content', with: 'first peep'
  click_button 'Post peep'
end

def peep_post_2
  visit('/peeps/post')
  fill_in 'title', with: '2'
  fill_in 'content', with: 'second peep'
  click_button 'Post peep'
end

def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :name, with: 'Pepé le Peep'
  fill_in :email, with: 'pepe@lepeep.com'
  fill_in :password, with: 'pepe!'
  click_button 'Sign up'
end
