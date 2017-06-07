feature "User writes a comment " do 
  scenario 'on a post' do
    sign_up
    write_post
    write_comment
    expect(page).to have_content "I'm a comment"
  end
end

