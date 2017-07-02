Chitter Challenge
==================


![id](https://raw.githubusercontent.com/Corina/chitter-challenge/master/public/chitter.jpg)


A Rock, Paper, Scissors web app where 2 players can play against each other. The first page displays a short story with the 3 characters.

The first page ask for players names, if none are given the game uses the default names. The first player must be *human* and is forced to make a choice between the 3 options but the second player can skip choosing and the computer will chose instead.

There are 2 modes of playing:
- sudden death: the game stops after one round
- best 3 out of five: score is kept for 5 games and results are announced after each round as well as the overall winer  


************************************************************
###### Example of how the winner is decided

![ScreenShot](https://github.com/Corina/rps-challenge/blob/master/public/deciding%20the%20winner.png?raw=true)

#### How to install it
- Fork this repo
- Run the command 'bundle' in the project directory to ensure you have all the gems

#### Extra functionality to be added
- Game logic allows for easy extension to more than 3 choices

#### How to test it
- Use rspec and rubocop
