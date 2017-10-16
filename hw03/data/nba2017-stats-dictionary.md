**Title of Database**: `NBA2017 players data`\
**Content**:`NBA2017 Player statistics.` \
**Number of observation**: `441`\
**Number of Attributes**:`24`\
**Source Origin** [reference:](https://www.basketball-reference.com) `main source.`\
**Sample source**: [web](https://www.basketball-reference.com/teams/GSW/2017.html)for the data source of a given team.\


* `Player`:name of the player.
- `games_player`:number of game played. 
- `minutes`: Total minutes of each player played. 
* `Experience`:years each player spent in the team.
- `GP`: Games Played furing regular season
- `GS`: Games Started
- `MIN`: Minutes Played during regular season
- `filed_goals_made`: Field Goals Made
- `filed_goals_atts`: Field Goal Attempts
- `Points3_made`: 3-Point Field Goals
* `Points3_atts`: 3-Point Field Goal Attempts
- `Points3_perc`: Percentage of points3_made over points3_atts.
- `Points2_made`: 2-Point Field Goals
* `Points2_atts`: 2-Point Field Goal Attempts
- `Points2_perc`:Percentage of points2_made over points2_atts.
- `FTM`: Free Throws Made
- `FTA`: Free Throw Attempts
- `OREB`: Offensive Rebounds
- `DREB`: Defensive Rebounds
- `AST`: Assists
- `STL`: Steals
- `BLK`: Blocks
- `TO`: Turnovers
- `Fouls`:Illegal personal contact with opponent. 


Although each object has its own data type, you can think of each of them as a variable from a statistics standpoint like so:

| Object       | Variable     |
|:-------------|:-------------|
| `Player`     | categorical  |
| `gamesplayer`|quantitative  |
| `minuts`     |quantitative  |
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
| `Points3_made`|quantitative |
| `Points3_atts`|quantitative |
| `Points3_perc`|quantitative |
| `Points2_made`|quantitative |
| `Points2_perc`|quantitative |
| `Points2_atts`|quantitative |
| `Points1_atts`|quantitative |
| `Points1_perc`|quantitative |
| `Points2_made`|quantitative |
| `Foul`        |quantitative |

