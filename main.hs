-- MCN Fantasy League Team Picker
-- http://mcn.fantasyleague.com/
-- Constraints:
--  - 2 Riders from each class (MotoGP, WSB, BSB)
--  - Total Team cost £10 million
-- NB:
--  - Each class has a different number of races per round

module Main where
import System.IO
import Data.List

-- Create lists of all Riders
import MotoGP
import WSB
import BSB

-- Extact data from Rider tuple
getName (name,_,_) = name
getPrice (_,price,_) = price
getPoints (_,_,points) = points

-- -- Return a new tuple with potential points
calculate_potential_points rider completed in_round =
  (getName(rider), getPrice(rider), (getPoints(rider) `div` completed) * in_round)
-- -- Map over passed Riders
calculate_potential_points' riders completed in_round =
  map (\rider -> calculate_potential_points rider completed in_round)  riders
-- -- Filter Riders with zero points
filter_riders riders = filter (\rider -> getPoints(rider) > 0) riders

-- -- Return all pairs of Riders
get_pair riders = [ [x, y] | x <- riders, y <- riders, elemIndex x riders < elemIndex y riders]

-- -- Return total cost of Team
team_cost team = sum $ map getPrice team

-- -- Return total potential points for Team
team_potential_points team = sum $ map getPoints team

-- -- Print Team
team_to_string team = intercalate ", " (map getName team)
item_to_string item = intercalate ", " [show (fst item), team_to_string(snd item)]
list_to_string list = intercalate "\n" (map item_to_string list)

main = do
  -- Calculate each Riders potential points (based on current points, races completed & races in round)
  let motogp = calculate_potential_points' MotoGP.riders MotoGP.races_completed MotoGP.races_in_round
  let filtered_motogp = filter_riders motogp
  let wsb = calculate_potential_points' WSB.riders WSB.races_completed WSB.races_in_round
  let filtered_wsb = filter_riders wsb
  let bsb = calculate_potential_points' BSB.riders BSB.races_completed BSB.races_in_round
  let filtered_bsb = filter_riders bsb

  -- Pick 2 Riders from each class
  let motogp_riders = get_pair filtered_motogp
  let wsb_riders = get_pair filtered_wsb
  let bsb_riders = get_pair filtered_bsb

  -- Iterate over each set of two riders from each class
  -- Filter to only valid team selections
  -- Sum teams potential points
  let possible_teams = [
        (team_potential_points(x ++ y ++ z), x ++ y ++ z)
        |
        x <- motogp_riders,
        y <- wsb_riders,
        z <- bsb_riders,
        team_cost(x ++ y ++ z) <= 10
        ]

  -- Order by potential points, display top 10
  let ordered_possible_teams = reverse(sort possible_teams)
  let top_ten = take 10 ordered_possible_teams

  putStrLn $ "Number of possible Teams: " ++ show (length possible_teams)
  putStrLn $ "Top Ten:"
  putStrLn $ list_to_string(top_ten)
