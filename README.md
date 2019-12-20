<center>

# 🕹️ Ruby - OOP (Object Oriented Programming) - Tic-Tac-Toe

</center>

<p align="center">
<img src="splash-screen.png" alt="Splash Screen">
</p>


This project is part of a series of projects to be completed by students of [Microverse](https://www.microverse.org/ 'The Global School for Remote Software Developers!').

This project consisted of creating a Tic-Tac-Toe game to be run from the command line, with the purpose of practicing and exercising the main concepts of Object Oriented Programming.

## 🚧 The Project Brief

The project specification and assinment details are part of The Odin Project's Ruby Programming course, which can be found [here.](https://www.theodinproject.com/courses/ruby-programming/lessons/oop)

This project was split up into four key milestones:
1. Project Setup 
    - Creation of the two main directories: 
         - **lib** for game logic;
         - **bin* for the executable file

2. User Interface
    - Planning and creation of the main flow of the game through which the user would   interact with the game.
    - Writing all the games content

3. Game Logic
    - Creating all classes and methods to give the game the ability to be played!
    - A 'Player' class allowing player creation
    - A 'Board' class to: 
      - Show a visual representation of the board to the player
      - Store players moves and fetch them
      - Define whether the game has ended in a win or a draw
    - A 'Game' class to:
      - Provide prompt users for their move and alternate on each turn
      - Randomise starting player on game start
      - Translate a numeric input of 1 to 9 to coordinates
      - Optional instructions display on start up
      - Rematch option at the end of the game
      - Randomised responses for the user for a different experience each time

4. ReadMe / Further Intructions

## 🔨 Technologies & Languages Used

- Ruby
- Rubocop
- Stickler-CI

## 👾 How To Play
### Requirements
You must have Ruby downloaded and available on your computer. If you do not, you can download it [here.](https://www.ruby-lang.org/en/downloads/)

### Setup
1. Download this repo and place it somewhere accessible and convenient.

3. The file you will use to run the game is the **main** file, located in the **bin** folder.
    - If you cannot run the file out of the box, give the **main** file execute permissions      using the following command in terminal:

      `chmod +x bin/main`

      This will allow you to double click the file and run it easily.

4. You will then be able to open the game by entering the following command into your terminal:

      `ruby ./bin/main`

> NB. In order for the two commands to successfully be implemented in your terminal, you must          navigate to the directory in which the game is located. [HELP](https://help.ubuntu.com/community/UsingTheTerminal)

### Lets Play!
Just incase you're not too familiar with the game of Tic-Tac-Toe (or Noughts and Crosses for that matter), it goes a little something like this:

- The game is played on a 3x3 board
- Each player is assigned either a 'O' or a 'X' at the start of the game
- The objective of the game is to line up three of your 'X's or 'O's either horizontally,          vertically or diagonally.
- Each player has one move per turn.
- If neither player lines up their 'X's or 'O's, then it's a draw!

Instructions are also optionally available in-game in case you forget!

## 🥂 Contributing

Contributions, issues and feature requests are more than welcome!<br />If you have any problems running or setting up the game, please do check out the [issues page.](https://github.com/queeksm/Enumerable-methods/issues)

If you want to make your own changes, modifications or improvements, go ahead and Fork it!
1. Fork it (https://github.com/queeksm/Tic-Tac-Toe/fork)
2. Create your working branch (git checkout -b [choose-a-name])
3. Commit your changes (git commit -am 'what this commit will fix/add/improve')
4. Push to the branch (git push origin [chosen-name])
5. Create a new Pull Request

## 👨🏽‍💻 👨🏿‍💻 Creators

Rory Hellier - [Github](https://github.com/Rhelli)

Andres Perez - [GitHub](https://github.com/queeksm)

## 🖐🏼 Show Your Support

Give a ⭐️ if you like this project!

## ⚖️ Licensing

This project is [MIT](https://github.com/queeksm/Tic-Tac-Toe/LICENSE.txt) licensed.