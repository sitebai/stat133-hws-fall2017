
library(dplyr)
library(ggplot2)


roster <- read.csv("nba2017-roster.csv")
stats <- read.csv("nba2017-stats.csv")
roster$salary<- round(roster$salary/1000000,2)


stats <- mutate(stats,missed_fg=field_goals_atts-field_goals_made)
stats <- mutate(stats,missed_ft=points1_atts-points1_made)
stats <- mutate(stats,rebounds=off_rebounds+def_rebounds)
totalpoints <- stats$points3_made*3+stats$points2_made*2+stats$points1_made
stats <- mutate(stats,points=totalpoints)
efficiency <- (stats$points+stats$rebounds+stats$assists+stats$steals+stats$blocks-stats$missed_fg-stats$missed_ft-stats$turnovers)/stats$games_played
stats <- mutate(stats,eff=efficiency)
summary(efficiency)

sink(file='../output/efficiency-summary.txt')
summary(efficiency)
sink()
stats

# Merging Tables.

free_throws <- stats$points1_made
stats <- mutate(stats,free_throws=free_throws)
point_2 <-stats$points2_made 
stats <- mutate(stats,points2=point_2)
points_3 <- stats$points3_made
stats <- mutate(stats,points3=points_3)
largetable <- merge(roster,stats)
#Creating nba2017-teams.csv
teams <- summarise(
  group_by(largetable,team),
  experience=sum(experience),
  salary=sum(salary),
  points3=sum(points3),
  points2=sum(points2),
  free_throws=sum(free_throws),
  totalpoints=sum(points),
  off_rebounds=sum(off_rebounds),
  def_rebounds=sum(def_rebounds),
  assists=sum(assists),
  steals=sum(steals),
  blocks=sum(blocks),
  turnovers=sum(turnovers),
  fouls=sum(fouls),
  efficiency=sum(eff)
)

largetable$team <- as.character(largetable$team)
sink(file="stat133/stat133-hws-fall17/hw03/data/teams-summary.txt")
summary(teams)
sink()


write.csv(summary(teams),"stat133/stat133-hws-fall17/hw03/data/nba2017-teams.csv",row.names = FALSE)

#some graphics
stars(teams[,-1],labels = teams$team)

teams$team <- as.character(teams$team)
pdf(file = "../images/teams_stars_plot.pdf")
stars(teams[,-1],labels = teams$team)
dev.off()

#use ggplot to get a scatterplot. 
ggplot(largetable,aes(x=experience,salary,label=team))+
  geom_point()+geom_text(size=2)

pdf(file = "../images/experience-salary.pdf")
ggplot(largetable,aes(x=experience,salary,label=team))+
  geom_point()+geom_text(size=2)
dev.off()


#ranking of teams. 
summarise(arrange(stats,desc(salary)),group_by(team))

filter(largetable,team=='GSW')
