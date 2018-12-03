# Counterfactual-Regret-Minimization
Many situations involve repeatedly making decisions in an uncertain environment. For instance, deciding what route to drive to college every day, or repeated play of a game against an opponent with an unknown strategy. Regret is what you experience when a foregone alternative performs better than the chosen one. When choosing between alternatives, decision makers aim to minimize anticipated regret. Players reach equilibrium by tracking regrets for past moves, making future moves proportional to positive regrets. When all players are simultaneously adapting in such a manner, algorithms aim to have strong guarantees for settings of this type, along with connections to game theoretic equilibria.

Here, I have managed to demnostrate simulation of a 2 player <b>Rock-Paper-Scissors</b> game. Player's strategy is defined by a regret minimization algorithm which uses following score matrix to evaluate each move and improve upon it in next game. Nash Equilibirum was achieved when both the players adopted same dynamic strategy based moves. Subsequent graphs shown below are cummulations of results achieved when the game was player over 10,000 rounds.
### Rock Paper Scissors
Rock-Scissors-Paper (RPS) is a two-player game where players each simultaneously make one of three
gestures: rock (a closed fist), paper (an open face-down palm), or scissors (exactly two fingers extended).
With each gesture, there is an opportunity to win, lose, or draw against the other player. Players
showing the same gesture draw. A rock wins against scissors, because “rock breaks scissors”. Scissors
wins against paper, because “scissors cuts paper”. Paper wins against rock, because “paper covers
rock”.  
Players will commonly synchronize play by calling out a four-beat chant, “Rock! Paper! Scissors!
Shoot!”, bobbing an outstretched fist on the first three beats, and committing simultaneously to one
of the three gestures on the fourth beat.

If number of players are ‘n’, then one shot games can be represented as an n-dimensional table, where each dimension has rows/columns corresponding to a single player's actions, each table entry corresponds to a single action profile (the intersection of a single action from each player), and the table entry contains a vector of utilities (a.k.a. payoffs or rewards) for each player. The payoff table for RPS is as follows:
<p align="center">
  <b>Figure 1</b><br>
  <img src="https://user-images.githubusercontent.com/22682743/49383597-1f9a3400-f73f-11e8-8cca-d3c998c2475a.png" width=300>
  <br>
  In this case, each entry has the form (u1; u2). By convention, the row player is player 1 and the column player is player 2.
</p>

A normal-form game is <b>zero-sum</b> if the values of each utility vector sum to 0.
Constant-sum games, where the values of each utility vector sum to a constant, may be reformulated as zero-sum games by adding a dummy player with a single dummy action that always receives the negated constant as a payoff.

A player plays with a pure strategy if the player chooses a single action with probability 1. A player plays with a mixed strategy if the player has at least two actions that are played with positive probability.

The <b>Nash equilibrium</b> is one solution concept. Another more general solution concept is that of the <b>correlated equilibrium</b>.
Each Nash equilibrium is a correlated equilibrium, but the concept of correlated equilibrium is more general, and permits important solutions.
In general, one might prefer to choose the action one regretted most not having chosen in the past, but one wouldn't want to be entirely predictable and thus entirely exploitable. One way of accomplishing this is through regret matching, where an agents actions are selected at random with a distribution that is proportional to positive regrets. Positive regrets indicate the level of relative losses one has experienced for not having selected the action in the past.

With regret matching, we then choose our next action proportionally to the positive regrets, and thus choose rock, paper, and scissors with probabilities, which are normalized positive regrets, i.e. positive regrets divided by their sum. Adding these to our previous regrets, we have cumulative regrets, this regret-matching for our next game yields a mixed-strategy.

### Cases:
We have found out strategy for minimising regret in two cases as following:
#### Static Opponent Strategy:
In the first setting, strategy of the second player remains static(constant) and it is initialized at the beginning of the program. Both the players then play the game for few thousand times. In every iteration both the players play the game once. The first player after every game adjusts its strategy according to the regret which is calculated based on the result of the game. For example if the first player played rock and won then the probability distribution of the strategy will shift a little towards rock. There is no change in the strategy of the second player. It remains constant throughout all the iterations.
<p align="center">
  <b>Figure 2</b><br>
  <img src="https://user-images.githubusercontent.com/22682743/49385532-aa7d2d80-f743-11e8-8e6b-ebb752162291.png" width=700>
  <br>
</p>

As seen from the above figure, opponent(other's) tries to play scissors with highest probability. So, our regret minization will train our moves to play rock as much as possible in order to defeat the opponent.

#### Dynamic Opponent Strategy:
In the second setting, strategy of the second player isn’t static. Just as we change our strategy he also alters his strategy which minimises it’s regret. And this goes on for thousands of iterations while training. In each iteration both of the players play the game, get the result and calculate regret based on the result and adjust their strategies to perform better in the next game. For example if the first player played rock and won that means the second player played scissor and lost. Thus the probability distribution for first player will shift towards rock strategy and probability distribution for second player will shift away from scissor strategy. After the training is complete we get strategies for both the players which will minimise regret for both of them.
<p align="center">
  <b>Figure 3</b><br>
  <img src="https://user-images.githubusercontent.com/22682743/49386069-c03f2280-f744-11e8-8336-55cc313fcdee.png" width=700>
  <br>  
</p>

As seen from the above figure, when the opponent and us, plays with same dynamic strategies, improving our regrets after each game round. It is observed that both players will play all the moves with equal probablities (i.e. 0.33). Hence, a nash equlibrium is said to be achieved.

### How to run
1. Make sure you have the properly installed Matlab.
2. Clone or download this repository.
3. Run "train.m" on Matlab. You can change the number of game rounds to be played.
4. Enjoy!

Reference: http://modelai.gettysburg.edu/2013/cfr/index.html
