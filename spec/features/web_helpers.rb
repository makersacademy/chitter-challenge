
def submit_post_1
  visit('/posts/new')
  fill_in('title', with: 'Test Post 1')
  fill_in('body', with: 'This is Chitter test post 1')
  click_button('Post')
end

def submit_post_2
  visit('/posts/new')
  fill_in('title', with: 'Test Post 2')
  fill_in('body', with: 'This is Chitter test post 2')
  click_button('Post')
end
