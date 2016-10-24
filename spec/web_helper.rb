def sign_up(email:, password:)
  visit('/users/new')
  expect(page.status_code).to eq(200)
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button('Sign up')
end

def sign_in(email:, password:)
  visit('/')
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button('Sign in')
end

def post_peep(body:)
  fill_in(:body, with: body)
  click_button('Post')
end
