Asteroids (Part 1)
==================
In this assignment we will start to replicate the old video game Asteroids. You will write a program that has a space ship that can be controlled with the keyboard. You will need to write a `SpaceShip` class. Your `SpaceShip` class will extend the `Floater` class, an abstract class that represents all things that float in space. 

An abstract class is an "incomplete" class. It has abstract methods--methods that have no body. When your class extends an abstract class, you must write the methods that are needed to "complete" the class. _Note: To complete this assignment you will be writing two classes `SpaceShip` and `Star`. Do not modify the `Floater` class._

Suggested steps to complete this assignment
-------------------------------------------

1. Fork and clone down the AsteroidsGame repository.
2. Uncomment the `extends floater` on Line 10
3. Complete the 10 abstract `set` and `get` functions
4. Write the `Spaceship` constructor. Make sure you initialize all 9 of the inherited `protected` member variables. You may find the [Asteroids PowerPoint](https://drive.google.com/file/d/0Bz2ZkT6qWPYTYjU0NDE5ZDYtYzEwOS00MGNlLTk0OGMtODBhODI3N2JiYzRi/view?usp=sharing) slides to be helpful. You may also find [this sample SpaceShip program](https://56d4b6566b56a59e1f634ea30f548666c459899d.googledrive.com/host/0Bz2ZkT6qWPYTallTVFJBOWdNcDQ/) to be helpful in understanding how the variables affect the SpaceShip's movement.
5. At the top of your program, declare a variable of type `SpaceShip`
6. Initialize the `SpaceShip` as a new instance of the class
7. In `draw()` call the SpaceShip's `show()` function
8. When you are happy with appearance of the SpaceShip, add a `public void keyPressed()` function to your program
9. Write code in `keyPressed` that allows you to control the space ship with the keyboard. You must include the ability to rotate left, rotate right, accelerate, and enter "hyperspace." (There is no requirement for any fancy visual effects, hyperspace just needs to stop the ship, and give it a new random position and direction.)
10. Add code to `draw()` to `move()` the Spaceship
11. Finally, add a `Star` class that creates a random number of stars in random positions
12. If you have extra time and are looking for a challenge, you might try to add an animation of "rockets" that appear from the back of the ship when you accelerate

These steps are only a suggestion. Your Asteroids game doesn't have to work or act like any other. Have fun and be creative.





Asteroids Part 2: An Array of Asteroids
Now that we have a functioning space ship, we'll add some Asteroids to our game. We'll write an Asteroid class that extends Floater.
Steps to completing this assignment
Write an Asteroid class that extends Floater. Make sure it's not inside the curly braces of any other class. You will need to
write a constructor
write the code to "finish" the abstract methods in the Floater class
add a new int member variable to hold the speed of rotation for each asteroid. Make sure that this is initialized to have an equal probablility of being positive or negative. Also make sure to declare appropriately (should it be public or private?)
"override" the move method of the Floater class by writing a new move method in the Asteroid class that also rotates each Asteroid at its own speed
Now add just a single asteroid to your applet. Start by just drawing the asteroid. Make sure you can see it and are happy with its shape before going to the next step.
Now add the code that moves and rotates the Asteroid
Modify your applet code so that you have an array of Asteroids.
You will need a web page to display your applet. Your homepage should have a link to the web page for this assignment.
Extensions
If you have extra time, you might try to figure out how to check to see if the ship has collided with an asteroid.
Submit the url of your github webpage with the URL for the assignment via the school loop drop box.