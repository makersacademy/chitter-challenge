# Notes
*Just some stuff I noted down along the way that I didn't have time to look into*

- When I was referring to class methods from within the class, I started off by writing e.g. `self.new`, but Rubocop gave me an offence for this, saying the `self` was unnecessary. But I feel like it's more readable than just doing `new`. Is there a convention on this?

- I turned off lazy loading for `Peep.content` because it wasn't loading at all in `view_peeps.erb`. Surely this shouldn't be necessary though. Why wasn't it loading?

- DataMapper is throwing a warning in my RSpec output, like this:
  ```
  > /Users/student/.rvm/gems/ruby-2.5.0/gems/data_objects-0.10.17/lib/data_objects/pooling.rb:149: warning: constant ::Fixnum is deprecated
  ```
  ... Slightly annoying. What's that all about?

- Now that all the model stuff is handled by DataMapper, it's not covered by unit tests. Is that right?? Should I write some anyway, even though it's all being outsourced? Does it make sense to write tests to check that a bundled gem is doing what it's supposed to do?

- Is it really necessary to create my own `Self.authenticate` method? Can't DataMapper do that for me?

- Might be good to get them to enter their password twice when signing up.

