**Title of Database**: `NBA2017 players data`\
**Content**:`NBA2017 Player statistics.` \
**Number of observation**: `441`\
**Number of Attributes**:`24`\
**Source Origin** [reference:](https://www.basketball-reference.com) `main source.`\
**Sample source**: [web](https://www.basketball-reference.com/teams/GSW/2017.html)for the data source of a given team.\


* `Player`:name of the player.
* `Team`:team name abbreviation.
* `Position`:player position.
* `Salary`:salary (in dollars)
* `Experience`:years each player spent in the team.
- `Rank`:Rank of player in his team.
- `Age`: Age of Player at the start of February 1st of that season.
- `GP`: Games Played furing regular season
- `GS`: Games Started
- `MIN`: Minutes Played during regular season
- `FGM`: Field Goals Made
- `FGA`: Field Goal Attempts
- `Points3`: 3-Point Field Goals
* `Points3_atts`: 3-Point Field Goal Attempts
- `Points2`: 2-Point Field Goals
* `Points2_atts`: 2-Point Field Goal Attempts
- `FTM`: Free Throws Made
- `FTA`: Free Throw Attempts
- `OREB`: Offensive Rebounds
-  `DREB`: Defensive Rebounds
- `AST`: Assists
- `STL`: Steals
- `BLK`: Blocks
- `TO`: Turnovers

**There are five types of player positions **(see [wikipedia](https://en.wikipedia.org/wiki/Basketball_positions) for more details):

+ `PG`: point guard
+ `SG`: shooting guard
+ `SF`: small forward
+ `PF`: power forward
+ `C`: center


The values in `points` result from adding all scored points:

```r
points1 + (2 * points2) + (3 * points3)
```

Although each object has its own data type, you can think of each of them as a variable from a statistics standpoint like so:

| Object       | Variable     |
|:-------------|:-------------|
| `Player`     | categorical  |
| `Team`       | categorical  |
| `Position`   | categorical  |
| `Experience` | quantitative |
| `Salary`     | quantitative |
| `Rank`       | quantitative |
| `Age`        | quantitative |
| `GP`         | quantitative |
| `GS`         |quantitative  |
| `MIN`        |quantitative  |
| `FGM`        |quantitative  |
| `FTA`        |quantitative  |
| `OREB`       |quantitative  |
| `DREB`       |quantitative  |
| `AST`        |quantitative  |
| `STL`        |quantitative  |
| `BLK`        |quantitative  |
| `TO`         |quantitative  |
