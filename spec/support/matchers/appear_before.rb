RSpec::Matchers.define :appear_before do |later_content|
  match do |earlier_content|
    page.body.index(earlier_content) < page.body.index(later_content)
  end
end

# Matcher provided by http://launchware.com/articles/acceptance-testing-asserting-sort-order