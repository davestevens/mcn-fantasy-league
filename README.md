# MCN Fantasy League Team Picker

Using Haskell to find the best team for the [MCN Fantasy League](http://mcn.fantasyleague.com/). I wanted to play with Haskell and though this might be a good idea for a little project.

## Constraints

* 2 Riders from each class (MotoGP, WSB, BSB)
* Total Team cost £10 million
* Each class has a different number of races per round
* You are only able to switch up to three riders during a transfer window

## Notes

I have removed any Riders who have not scored any points to reduce the list of all Teams from 64,935,000 to 7,220,988.
This list is then filtered based on the total cost of the Team being below £10 million, resulting in 6,379,135 possible Teams.

The potential points are calculated based on the Riders average points per race throughout the previous round, multiplied by the number of races in the current round.

These potential points are then summed up for the Team with the top ten predicted teams listed below.

## Results

The top 10 Teams for Game Round 5 are

1. V Rossi, J Lorenzo, M Baiocco, R Ramos, S Byrne, J Brookes - Predicted Points: 334
2. V Rossi, J Lorenzo, L Mercado, R Ramos, S Byrne, J Brookes - Predicted Points: 334
3. V Rossi, J Lorenzo, N Terol, L Mercado, S Byrne, J Brookes - Predicted Points: 332
4. V Rossi, J Lorenzo, A Badovini, R Ramos, S Byrne, J Brookes - Predicted Points: 332
5. V Rossi, J Lorenzo, N Canepa, L Mercado, S Byrne, J Brookes - Predicted Points: 330
6. V Rossi, J Lorenzo, N Terol, R Ramos, S Byrne, J Brookes - Predicted Points: 328
7. J Lorenzo, A Iannone, J Torres, L Mercado, S Byrne, J Brookes - Predicted Points: 328
8. V Rossi, J Lorenzo, N Canepa, R Ramos, S Byrne, J Brookes - Predicted Points: 326
9. V Rossi, A Iannone, J Torres, L Mercado, S Byrne, J Brookes - Predicted Points: 325
10. V Rossi, J Lorenzo, N Terol, N Canepa, S Byrne, J Brookes - Predicted Points: 324

The top 10 teams for Game Round 5 (based on my current team) are
1. V Rossi, J Lorenzo, L Mercado, R Ramos, S Byrne, J Brookes - Predicted Points: 334
2. V Rossi, J Lorenzo, N Terol, L Mercado, S Byrne, J Brookes - Predicted Points: 332
3. V Rossi, J Lorenzo, N Canepa, L Mercado, S Byrne, J Brookes - Predicted Points: 330
4. J Lorenzo, A Iannone, J Torres, L Mercado, S Byrne, J Brookes - Predicted Points: 328
5. V Rossi, A Iannone, J Torres, L Mercado, S Byrne, J Brookes - Predicted Points: 325
6. J Lorenzo, A Iannone, J Torres, R Ramos, S Byrne, J Brookes - Predicted Points: 324
7. J Lorenzo, A Iannone, J Torres, N Terol, S Byrne, J Brookes - Predicted Points: 322
8. V Rossi, A Iannone, J Torres, R Ramos, S Byrne, J Brookes - Predicted Points: 321
9. J Lorenzo, A Iannone, M Baiocco, L Mercado, S Byrne, J Brookes - Predicted Points: 320
10. J Lorenzo, A Iannone, J Torres, N Canepa, S Byrne, J Brookes - Predicted Points: 320
