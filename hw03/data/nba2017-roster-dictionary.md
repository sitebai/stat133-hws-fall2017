**Title of Database**: `NBA2017 roster data`\
**Content**:`NBA2017 roster statistics.` \
**Number of observation**: `441`\
**Number of Attributes**:`8`\
**Source Origin** [reference:](https://www.basketball-reference.com) `main source.`\
**Sample source**: [web](https://www.basketball-reference.com/teams/GSW/2017.html)for the data source of a given team.\

* `Player`:name of the player.
* `Team`:team name abbreviation.
* `Position`:player position.
* `Salary`:salary (in dollars).
* `Height`:The height of each player. 
- `Experience`: Playing year of each player. 
- `Age`: Age of Player at the start of February 1st of that season.
- `weight`: The weight of each player. 


**There are five types of player positions **(see [wikipedia](https://en.wikipedia.org/wiki/Basketball_positions) for more details):

+ `PG`: point guard
+ `SG`: shooting guard
+ `SF`: small forward
+ `PF`: power forward
+ `C`: center



| Object       | Variable     |
|:-------------|:-------------|
| `Player`     | categorical  |
| `Team`       | categorical  |
| `Position`   | categorical  |
| `Experience` | quantitative |
| `Salary`     | quantitative |
| `Height`     | quantitative |
| `Age`        | quantitative |
| `Weight`     | quantitative |
