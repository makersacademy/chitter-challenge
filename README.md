Installation Instructions should be in README

Particularly now that we have a database involved, it becomes even more important to ensure that correct installation instructions are included in your readme so that other developers (and yourself in the future) know how to get set up with the application, e.g.

$ git clone https://github.com/tansaku/chitter_challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
And as we saw in previous weeks you'll want to have screenshots of how the app works, or perhaps even a link to the deployed version on heroku?

For more info on embedding images in a README: https://guides.github.com/features/mastering-markdown/

e.g.:

![Screenshot](https://path_to_your_image)
You will need to host your images somewhere, e.g.:

http://imgur.com/
http://dropbox.com/
