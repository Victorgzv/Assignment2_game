<h1>OOP Game Assignment 2016/2017</h1>
<ul>
<li>Assignment: Create a game in Processing</li>
<li>Link to youtube video: https://www.youtube.com/watch?v=OHUOquZpyrw</li>
</ul>
<h1>Catch the Frog</h1>
<h2>CONCEPT</h2>
<p>I have called this game Catch the Frog. Inspired by the arcde game Ping Pong but in this case we control the movement of the ball instead of the trampoline platfrms
This game consists of six levels where you control a orange ball that bounces in 2 platforms, you need to hit as much frogs are possible in order to pass to the next level.
This game requires the player to carefully move skillfully around to catch frogs and power ups using A (Left) and D (Right).</p>

<h2>DESIGN</h2>
<p>The design of this game is very simple. The user is a simple orange ball and the points to score are green shapes that represent a frog</p>
<p>The player first sees the splash screen and after that the game screen.</p>
splash screen:
<p>This screen presents the name of the game followed by intuitive instructions that give the user an idea of how the works.</p>
<p>The powerups are presented in their actual color and it is described their functionality. I want to give the user and of how the power ups look like, and what the points(frogs) look like.</p>
<h2>CONTROLS</h2>
<p>A to move LEFT,D to Move Right</p>
Jetpack: Adds functionality to W to move UP and S to Move DOWN</p>
<h2>Functionality</h2>
<p>Most class(Point,Big,JetPack and SlowMotion) extend the GameObject abstract class. This allows having some variables and methods that are common to these classes </p>
<ul>
<li><h3>Player</h3></li>
<p>The player (orange ball) is set to start at the top of the screen and moves downwards. This player behaves in different ways depending on what powers are obtained.It is controlled with A and D and it bounces in the left, right and bottom of the screen. If the player falls the game is over.</p>

<li><h3>Frog</h3></li>
<p>The frogs are represented as green shapes that are the points to go to the next level.Each level is a point and each 5 frogs is a level.They spawn at each level randomly.Initially the frog has a fixed position but after collecting 5 of them starts level 2 and the frog starts moving around the screen in a random direction, each level it moves faster. By using an arraylist there are 2 fogs in level 5. </p>

<li><h3>Platforms</h3></li>
<p>The platform consist in 2 thick lines which the player uses to bounce off. Both move in different directions. </p>

<li><h3>Power Ups</h3></li>
<p>There are 3 Power Ups, Jetpack, Slow Motion and Size alteration, which spawn at random times during a level, they have a time to live which is 15 seconds from spawning.They are randomly generated on the screen from left to right.When the player comes into contact with Jetpack power (red circle ) up it enables moving our player UP and DOWN. When the player comes into contact with Slow Motion (blue circle) power up the game frameRate is slowed down for a certain time and after that it s back to normal. When the player comes into contact with size alteration (yellow ball) its size is 15 pixels bigger. </p>
</ul>

<li><h3>Sound</h3></li>
<p>There is sounds played for some events like for obtaining respective power ups, frogs or bouncing off the platforms and also a sound for game over; </p>
</ul>




