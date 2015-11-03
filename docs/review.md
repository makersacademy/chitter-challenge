# Introduction
Welcome to the code review for the Chitter Challenge!  Again, don't worry - you are not expected to have all the answers. The following is a code-review scaffold for Chitter Challenge that you can follow if you want to.  These are common issues to look out for in this challenge - but you may decide to take your own route.

If you don't feel comfortable giving technical feedback at this stage, try going through this guide with your reviewee and review the code together.

Please use this form to tick off where your reviewee has successfully has successfully incorporated these guidelines!  This form helps us get an overall picture of how the whole cohort is doing - it's not an assessment of an individual student.

# Step 0: Checkout and Run tests

Please checkout your reviewee's code and run their tests. Read the code and try and use the app through the web interface.  You can also experiment with the engine in IRB. How easy is it to understand the structure of their code? How readable is their code? Did you need to make any cognitive leaps to 'get it'?

# Step 0.5?  How far did they get?

* stage 1
* stage 2
* stage 3?

general comments here if you want to skip the following????

# Step 1: Structure and supporting files

## Installation Instructions in README

Particularly now that we have a database involved, it becomes even more important to ensure that correct installation instructions are included in your readme so that other developers (and yourself in the future) know how to get set up with the application:

```
TODO example
```

And as we saw in previous weeks you'll want to have screenshots of how the app works, or perhaps even a link to the deployed version on heroku?

For more info on embedding images in a README: https://guides.github.com/features/mastering-markdown/

e.g.:
```
![Screenshot](https://path_to_your_image)
```

You will need to host your images somewhere, e.g.:
* http://imgur.com/
* http://dropbox.com/

## Inconsistent folder layout (Sinatra structure)

Sinatra is not a particularly opinionated framework (unlike Rails).  This means it does not mandate folder structures and naming conventions.  This gives developers the freedom to choose their own structures according to the needs of a project.

Structure is an important decision in your design as it affects readability.  One of the most important considerations is the *separation of concerns*

Here is a checklist to consider:
If the structure has an `/app` folder:
* Is the server file (e.g rps_web.rb or app.rb) at the top level of the `/app` folder?
* Is the `/views` folder in `/app`?
* Is the `/lib` folder in the project root folder?

```
├── app
│   └── rps_web.rb
│   └── views
│       └── index.erb
├── lib
│   ├── game.rb
│   ├── computer.rb
│   └── player.rb
└── spec
    └── spec_helper.rb
```

If the structure does not have an `/app` folder:
* Is the server file (e.g rps_web.rb or app.rb) in the project root folder?

```
├── lib
│   ├── game.rb
│   ├── computer.rb
│   └── player.rb
├── spec
│   └── spec_helper.rb
├── views
│   └── index.erb
└── rps_web.rb
```

## Inconsistent file naming

Ruby class files should be named with the snake_case version of the class name.  Class names should be PascalCase.  Hence:
### Good

- `class RPS` -> `rps.rb`
- `class RPSWeb` -> `rps_web.rb`

### Bad

- `class RPS_web` -> `rps_web.rb`
- `class RPSWeb` -> `rps.rb`

## Not initializing capybara/ spec_helper correctly

In `spec/spec_helper.rb`, don't forget to add `Capybara.app = MyRackApp` or similar. You can use generators such as `rspec-sinatra init myApp lib/myapp.rb` but beware that the spec_helper will be overwritten; make sure you copy all the pre-written CI code, otherwise you will break your coveralls CI, causing silent failure of your pull request.

## Not removing comments before committing

Old code should be deleted before you commit - it is distracting and makes your code hard to read. There is no reason to keep commented-out code - if you are commiting regularly, all your code will be in git so you can easily look back at how it looked before you made changes.


# Step 2: Tests and \*\_spec.rb files  

## \*\_spec.rb files (unit tests)

### Not testing all of the game logic in unit tests
As there is a discrete number of possible outcomes, your tests should test them all.  This may seem like overkill, but how else will you know that your game logic is correct in all circumstances?


## \*\_spec.rb files (feature tests)

### Testing game logic in feature tests
Your feature test should not need to test all of the rock/paper/scissors(/lizard/spock) possibilities - this is the responsibility of your unit tests.

### Not testing all game outcomes in feature tests
Although you do not need to test all possible combinations, your feature tests should test every possible outcome - i.e.:

- a win
- a loss
- and a draw.

to ensure the user interface logic is correct.

### Stub out random behaviour

* stub out random behaviour to ensure your feature tests pass consistently, e.g. (i)

```ruby
feature 'Playing the game' do
  scenario "When I submit 'Rock' I am told if I have won" do
    allow_any_instance_of(Array).to receive(:sample).and_return('scissors')
    visit '/'
    fill_in('name', with: 'Philip')
    select('rock', from: 'your_choice')
    click_button('Play')
    expect(page).to have_content "The result is .... You won"
  end
end
```

# Step 3: Application code and \*.rb files

## Including presentation strings in business logic layer

Your `Game` class (or similar) should not return presentation strings like `"Congratulations - you won!"`.  This is a presentation concern and should be handled in another layer of code (**separation of concerns**).  Instead, return representative codes, such as `:win` and `:draw` from the `Game` class which can be translated by the presentation layer.

This approach makes it possible to change the presentation layer (e.g. to add support for a different language) without changing the lower-level code (**open/closed principle**).

**bad**

```ruby
class Game
  def result
    'Congratulations - you won!'
  end
end

class RPSWeb < Sinatra::Application
  get '/result' do
    @game = Game.new
    erb :result
  end
end
```

```html
<h1><%= @game.result%></h1>
```

**good**

```ruby
class Game
  def result
    :win # hard coded for example purposes
  end
end

class RPSWeb < Sinatra::Application
  get '/result' do
    @game = Game.new
    erb @game.result
  end
end
```

in `views/win.erb`:

```html
<h1>Congratulations - you won</h1>
```

## Use of `if/elsif` conditionals for business logic

Long `if` and `elsif` trees are very difficult to read and nested `if` statements require too much working memory for a reader to quickly scan.

There are a number of approaches to the game logic of Rock Paper Scissors,  e.g.:

- Use a hash to map the rules:

```ruby
RULES = { rock: :scissors,
          paper: :rock,
          scissors: :paper }
```

or for RPSLS:

```ruby
RULES = { rock: [scissors, lizard],
          paper: [:rock, :spock],
          scissors: [:paper, :lizard],
          lizard: [:paper, :spock],
          spock: [:rock, :scissors] }
```
- Use a `Weapon` class with a `beats?` or similar method that takes another weapon instance as a parameter.

```ruby
class Weapon
  attr_reader :type

  def initialize(type)
    @type = type.to_sym
  end

  def beats?(other)
    RULES[type][other.type]
  end
end

rock = Weapon.new(:rock)
rock.beats?(Weapon.new(:scissors))
```

## Not encapsulating the 'computer' in a separate class

By creating a `Computer` class, you can take advantage of duck-typing in the game class.  The game does not need to know if it's comparing two players or one player vs a computer or even two computers!

```ruby
class Computer
  def weapon
    [:rock, :paper, :scissors].sample
  end
end

class Player
  attr_reader :weapon

  def weapon=(weapon)
    fail 'not a possible weapon' unless [:rock, :paper, :scissors].includes? weapon
    @weapon = weapon
  end
end
```

## Use of global variables

It is tempting to use global variables to ensure instances of a game or players are persisted across calls to the server.  But [*global variables are evil*](http://c2.com/cgi/wiki?GlobalVariablesAreBad).  There are a number of other ways to achieve the same thing.  While some may argue these also introduce 'globally accessible' state, the critical difference is we have more control over this state and it is properly **namespaced**.  Here is an example using a class methods inside the server and Sinatra helper methods to encapsulate the interface:

```ruby
class Player

  # class methods

  def self.find(id)
    players[id]
  end

  def self.add(id, player)
    players[id] = player
  end

  def self.players
    @players ||= {}
  end

  # instance methods

  attr_reader :name

  # ... other instance methods
end

class RPSWeb < Sinatra::Application
  enable :sessions

  helpers do
    def current_player
      Player.find(session[:player_id])
    end

    def add_player(player)
      id = player.object_id
      Player.add(id, player)
      session[:player_id] = id
    end
  end

  get '/' do
    "Hello #{current_player.name}" if current_player
  end

  post '/player' do
    player = Player.new(params[:name])
    add_player(player)
    redirect_to '/'
  end
end
```

## Not storing the weapons in a constant

If you have something like this:

```ruby
def weapons
  ['Rock', 'Paper', 'Scissors']
end
```

Then *four* new objects will be created *every time you call `weapons`*  (what are the four objects?).  Use a constant with symbols instead:

```ruby
WEAPONS = [:rock, :paper, :scissors]
```

## Inconsistent routing and route naming

Routes should not have dual purposes.  Each discrete action of your programme should have its own dedicated route (N.B. the route comprises both the verb and the path).

The preferred convention for naming routes is snake_case, e.g. `game` over `Game`.

```ruby
class RPSWeb < Sinatra::Application

  get '/game' do
    erb :new_game
  end

  post '/game' do
    @game = Game.new(params)
    redirect to '/play'
  end
end

```

In the above example the first route GETs the form that allows a user to create a new game.  This action does not change any state on the server so it's important that we use the GET action, and not POST.  The second route corresponds to the POSTed submission of the new game form.  This action does create some state on the server, i.e. the creation of a particular game, so it makes sense to use the active verb POST here.

## Defining weapons in more than one place

Don't Repeat Yourself (DRY)!  The list of available weapons should be defined in only one place.  It can be passed around or referenced or injected, but not duplicated!

Let's DRY the code from the encapsulation example above:

```ruby
class Game
  WEAPONS = [:rock, :paper, :scissors]
end

class Computer
  def weapon
    Game::WEAPONS.sample
  end
end

class Player
  attr_reader :weapon

  def weapon=(weapon)
    fail 'not a possible weapon' unless Game::WEAPONS.includes? weapon
    @weapon = weapon
  end
end
```

## Calling business logic from the view

It is the controller's responsibility to pass the player's weapon to the game and get the result.  Use instance variables or helper methods to represent or convert this result for rendering in the view.

**bad**

```ruby
class Game
  def result
    :win
  end
end

class RPSWeb < Sinatra::Application
  get '/choose' do
    @player1_choice = params[:choice]
    @game = Game.current_game(session[:game_id])
    erb :result
  end
end
```

```html
<h1>
<% @game.player1_choice(@player1_choice) %>
<% if @game.result == :win %>
  Congratulations - you won
<% else %>
  Sorry - you lost
<% end %>
</h1>
```

**better**

```ruby
class Game
  def result
    :win
  end
end

class RPSWeb < Sinatra::Application
  get '/choose' do
    @game.player1_choice(params[:choice])
    erb @game.result
  end
end
```

in `views/win.erb`:

```html
<h1>Congratulations - you won</h1>
```

## Fat controllers

Game logic should be executed in your lib files. You should minimise the amount of logic in the controller by extracting it to the lib files. This helps to ensure your code is testable, maintainable and reusable.

**bad**

```ruby
class RPSWeb < Sinatra::Application
  get '/choose' do
    @player_choice = params[:choice]
    @computer_choice = [:rock, :scissors, :paper].sample
    @result = 'you lose!'
    if RULES[@player_choice][@computer_choice]
      @result = 'you win!'
    end
    erb :result
  end
end
```

```html
<h1><%= @result %></h1>
```

**better**

```ruby
class Game
  WEAPONS = [:rock, :paper, :scissors]
  def player_choice=(weapon)
    fail 'not a possible weapon' unless WEAPONS.includes? weapon
    @player_choice = weapon
  end
  def result
    RULES[player_choice][computer.choice()] ? :win : :lose
  end
end

class RPSWeb < Sinatra::Application
  get '/play' do
    @game.player1_choice = params[:choice]
    erb @game.result
  end
end
```

in `views/win.erb`:

```html
<h1>Congratulations - you won</h1>
```
