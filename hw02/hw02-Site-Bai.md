hw02-Site-Bai.Rmd
================
Site Bai
9/28/2017

-   **Manipulating R.csv.**

``` r
NBA17base <- read.csv('nba2017-player-statistics.csv',colClasses = c("character","character","factor","character","double","integer",rep('integer',18)))

str(NBA17base)
```

    ## 'data.frame':    441 obs. of  24 variables:
    ##  $ Player      : chr  "Al Horford" "Amir Johnson" "Avery Bradley" "Demetrius Jackson" ...
    ##  $ Team        : chr  "BOS" "BOS" "BOS" "BOS" ...
    ##  $ Position    : Factor w/ 5 levels "C","PF","PG",..: 1 2 5 3 4 3 4 5 4 2 ...
    ##  $ Experience  : chr  "9" "11" "6" "R" ...
    ##  $ Salary      : num  26540100 12000000 8269663 1450000 1410598 ...
    ##  $ Rank        : int  4 6 5 15 11 1 3 13 8 10 ...
    ##  $ Age         : int  30 29 26 22 31 27 26 21 20 29 ...
    ##  $ GP          : int  68 80 55 5 47 76 72 29 78 78 ...
    ##  $ GS          : int  68 77 55 0 0 76 72 0 20 6 ...
    ##  $ MIN         : int  2193 1608 1835 17 538 2569 2335 220 1341 1232 ...
    ##  $ FGM         : int  379 213 359 3 95 682 333 25 192 114 ...
    ##  $ FGA         : int  801 370 775 4 232 1473 720 58 423 262 ...
    ##  $ Points3     : int  86 27 108 1 39 245 157 12 46 45 ...
    ##  $ Points3_atts: int  242 66 277 1 111 646 394 35 135 130 ...
    ##  $ Points2     : int  293 186 251 2 56 437 176 13 146 69 ...
    ##  $ Points2_atts: int  559 304 498 3 121 827 326 23 288 132 ...
    ##  $ FTM         : int  108 67 68 3 33 590 176 6 85 26 ...
    ##  $ FTA         : int  135 100 93 6 41 649 217 9 124 37 ...
    ##  $ OREB        : int  95 117 65 2 17 43 48 6 45 60 ...
    ##  $ DREB        : int  369 248 269 2 68 162 367 20 175 213 ...
    ##  $ AST         : int  337 140 121 3 33 449 155 4 64 71 ...
    ##  $ STL         : int  52 52 68 0 9 70 72 10 35 26 ...
    ##  $ BLK         : int  87 62 11 0 7 13 23 2 18 17 ...
    ##  $ TO          : int  116 77 88 0 25 210 79 4 68 39 ...

``` r
is.factor(NBA17base$Position)
```

    ## [1] TRUE

-   **Manipulating R\_csv.**

``` r
nba17readr <- read_csv('nba2017-player-statistics.csv')
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_integer(),
    ##   Player = col_character(),
    ##   Team = col_character(),
    ##   Position = col_character(),
    ##   Experience = col_character(),
    ##   Salary = col_double()
    ## )

    ## See spec(...) for full column specifications.

``` r
nba17readr$Position <- factor(nba17readr$Position)
str(nba17readr)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    441 obs. of  24 variables:
    ##  $ Player      : chr  "Al Horford" "Amir Johnson" "Avery Bradley" "Demetrius Jackson" ...
    ##  $ Team        : chr  "BOS" "BOS" "BOS" "BOS" ...
    ##  $ Position    : Factor w/ 5 levels "C","PF","PG",..: 1 2 5 3 4 3 4 5 4 2 ...
    ##  $ Experience  : chr  "9" "11" "6" "R" ...
    ##  $ Salary      : num  26540100 12000000 8269663 1450000 1410598 ...
    ##  $ Rank        : int  4 6 5 15 11 1 3 13 8 10 ...
    ##  $ Age         : int  30 29 26 22 31 27 26 21 20 29 ...
    ##  $ GP          : int  68 80 55 5 47 76 72 29 78 78 ...
    ##  $ GS          : int  68 77 55 0 0 76 72 0 20 6 ...
    ##  $ MIN         : int  2193 1608 1835 17 538 2569 2335 220 1341 1232 ...
    ##  $ FGM         : int  379 213 359 3 95 682 333 25 192 114 ...
    ##  $ FGA         : int  801 370 775 4 232 1473 720 58 423 262 ...
    ##  $ Points3     : int  86 27 108 1 39 245 157 12 46 45 ...
    ##  $ Points3_atts: int  242 66 277 1 111 646 394 35 135 130 ...
    ##  $ Points2     : int  293 186 251 2 56 437 176 13 146 69 ...
    ##  $ Points2_atts: int  559 304 498 3 121 827 326 23 288 132 ...
    ##  $ FTM         : int  108 67 68 3 33 590 176 6 85 26 ...
    ##  $ FTA         : int  135 100 93 6 41 649 217 9 124 37 ...
    ##  $ OREB        : int  95 117 65 2 17 43 48 6 45 60 ...
    ##  $ DREB        : int  369 248 269 2 68 162 367 20 175 213 ...
    ##  $ AST         : int  337 140 121 3 33 449 155 4 64 71 ...
    ##  $ STL         : int  52 52 68 0 9 70 72 10 35 26 ...
    ##  $ BLK         : int  87 62 11 0 7 13 23 2 18 17 ...
    ##  $ TO          : int  116 77 88 0 25 210 79 4 68 39 ...
    ##  - attr(*, "spec")=List of 2
    ##   ..$ cols   :List of 24
    ##   .. ..$ Player      : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ Team        : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ Position    : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ Experience  : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ Salary      : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
    ##   .. ..$ Rank        : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ Age         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ GP          : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ GS          : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ MIN         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ FGM         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ FGA         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ Points3     : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ Points3_atts: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ Points2     : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ Points2_atts: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ FTM         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ FTA         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ OREB        : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ DREB        : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ AST         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ STL         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ BLK         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ TO          : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   ..$ default: list()
    ##   .. ..- attr(*, "class")= chr  "collector_guess" "collector"
    ##   ..- attr(*, "class")= chr "col_spec"

-   **Right after importing the data.**

``` r
NBA17base$Experience[NBA17base$Experience =="R"] <- "0"
experience0 <- as.integer(NBA17base$Experience)
```

-   **Performance of players.**

``` r
PTS =NBA17base$Points3*3+NBA17base$Points2*2+
  NBA17base$FTM*1
Rebounds =NBA17base$OREB+NBA17base$DREB
MissedFG =NBA17base$FGA-NBA17base$FGM
MissedFT =NBA17base$FTA-NBA17base$FTM
Ast = NBA17base$AST
Stl =NBA17base$STL
BLK= NBA17base$BLK
To= NBA17base$TO
Gp  = NBA17base$GP

EFF=(PTS+Rebounds+Ast+Stl+BLK-MissedFG-MissedFT-To)/Gp
summary(EFF)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##  -0.600   5.452   9.090  10.140  13.250  33.840

-   **Display the player name,team, salary and EFF value of the top 10 players in decreasing order. **
-   \*\* How to add a new column.\*\*

``` r
NBA17base <- mutate(NBA17base,eff=EFF)
select(slice(arrange(NBA17base,desc(eff)),1:10),Player)
```

    ## # A tibble: 10 x 1
    ##                   Player
    ##                    <chr>
    ##  1     Russell Westbrook
    ##  2          James Harden
    ##  3         Anthony Davis
    ##  4          LeBron James
    ##  5    Karl-Anthony Towns
    ##  6          Kevin Durant
    ##  7 Giannis Antetokounmpo
    ##  8      DeMarcus Cousins
    ##  9          Jimmy Butler
    ## 10      Hassan Whiteside

``` r
select(slice(arrange(NBA17base,desc(EFF)),1:10),Player,Team,Salary,eff)
```

    ## # A tibble: 10 x 4
    ##                   Player  Team   Salary      eff
    ##                    <chr> <chr>    <dbl>    <dbl>
    ##  1     Russell Westbrook   OKC 26540100 33.83951
    ##  2          James Harden   HOU 26540100 32.34568
    ##  3         Anthony Davis   NOP 22116750 31.16000
    ##  4          LeBron James   CLE 30963450 30.97297
    ##  5    Karl-Anthony Towns   MIN  5960160 30.32927
    ##  6          Kevin Durant   GSW 26540100 30.19355
    ##  7 Giannis Antetokounmpo   MIL  2995421 28.37500
    ##  8      DeMarcus Cousins   NOP 16957900 27.94118
    ##  9          Jimmy Butler   CHI 17552209 25.60526
    ## 10      Hassan Whiteside   MIA 22116750 25.36364

``` r
select(slice(arrange(NBA17base,desc(Salary)),1:10),Player,Salary)
```

    ## # A tibble: 10 x 2
    ##               Player   Salary
    ##                <chr>    <dbl>
    ##  1      LeBron James 30963450
    ##  2        Al Horford 26540100
    ##  3     DeMar DeRozan 26540100
    ##  4      Kevin Durant 26540100
    ##  5      James Harden 26540100
    ##  6 Russell Westbrook 26540100
    ##  7       Mike Conley 26540100
    ##  8     Dirk Nowitzki 25000000
    ##  9   Carmelo Anthony 24559380
    ## 10    Damian Lillard 24328425

-   **Provide the names of the players that have a negative EFF**

``` r
select(filter(NBA17base,eff <0),Player)
```

    ##            Player
    ## 1 Patricio Garino

-   Use the function cor() to compute the correlation coefficients between EFF and all the variables used in the EFF formula.

``` r
c1 <- cor(EFF,PTS)
c2 <- cor(EFF,Rebounds)
c3 <- cor(EFF,NBA17base$AST)
c4 <- cor(EFF,NBA17base$STL)
c5 <- cor(EFF,NBA17base$BLK)
c6 <- cor(EFF,-MissedFG)
c7 <- cor(EFF,-MissedFT)
c8 <- cor(EFF,-NBA17base$TO)
corr <- c(c1,c2,c3,c4,c5,c6,c7,c8)
corr <- sort(corr,decreasing = TRUE)
barplot(corr,names.arg =c( "PTS","REB","STL","AST","BLK","MissedFT","MissedFG","TO"),col="pink")
```

![](hw02-Site-Bai_files/figure-markdown_github/unnamed-chunk-7-1.png) \* **Efficiency and salary.**

``` r
NBA17base$Salary <- round(NBA17base$Salary/1000000,2)
plot(EFF,NBA17base$Salary)
lines(lowess(EFF,NBA17base$Salary),lwd=3,col="blue")
```

![](hw02-Site-Bai_files/figure-markdown_github/unnamed-chunk-8-1.png)

``` r
lm(NBA17base$Salary~EFF)
```

    ## 
    ## Call:
    ## lm(formula = NBA17base$Salary ~ EFF)
    ## 
    ## Coefficients:
    ## (Intercept)          EFF  
    ##     -0.7082       0.6802

-   **Why NBA stars get paid so much more than NFL stars. **

``` r
NBA17base <- mutate(NBA17base,mpg=MIN/GP)
players2 <- select(filter(NBA17base,mpg>20),Player,eff,Salary)
is.data.frame(players2)
```

    ## [1] TRUE

``` r
plot(players2$eff,players2$Salary)
lines(lowess(players2$eff,players2$Salary),lwd=3,col="green")
```

![](hw02-Site-Bai_files/figure-markdown_github/unnamed-chunk-9-1.png)

``` r
lm(players2$Salary~players2$eff)
```

    ## 
    ## Call:
    ## lm(formula = players2$Salary ~ players2$eff)
    ## 
    ## Coefficients:
    ##  (Intercept)  players2$eff  
    ##      -0.6451        0.6907

.
