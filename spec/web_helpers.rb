

def post_a_peep
  visit('/')
  fill_in "content", with: "this is a test peep"
  click_on("Post Peep")
end

def successive_peep_posts
  2.times {visit('/')
  fill_in "content", with: "this is a test peep"
  click_on("Post Peep")
  sleep 1}
end
