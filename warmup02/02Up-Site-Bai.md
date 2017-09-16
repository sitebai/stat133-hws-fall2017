Up02-Site-Bai.Rmd
================
Site Bai
9/12/2017

``` r
mode(experience)
```

    ## [1] "character"

``` r
mode(github)
```

    ## [1] "character"

``` r
mode(player)
```

    ## [1] "character"

``` r
mode(points)
```

    ## [1] "numeric"

``` r
mode(team)
```

    ## [1] "numeric"

``` r
mode(points1)
```

    ## [1] "numeric"

``` r
mode(points2)
```

    ## [1] "numeric"

``` r
mode(points3)
```

    ## [1] "numeric"

``` r
is.vector(github)
```

    ## [1] TRUE

``` r
is.atomic(player)
```

    ## [1] TRUE

``` r
class(position)
```

    ## [1] "character"

``` r
#what flavor is each vector? 

length(player)
```

    ## [1] 441

``` r
length(team)
```

    ## [1] 441

``` r
length(points)
```

    ## [1] 441

``` r
length(points1)
```

    ## [1] 441

``` r
length(points2)
```

    ## [1] 441

``` r
length(points3)
```

    ## [1] 441

``` r
summary(player)
```

    ##    Length     Class      Mode 
    ##       441 character character

``` r
summary(salary)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ##     5145  1286000  3500000  6187000  9250000 30960000

``` r
sd(salary)
```

    ## [1] 6571890

``` r
hist(salary)
```

![](02Up-Site-Bai_files/figure-markdown_github/unnamed-chunk-2-1.png)

``` r
boxplot(salary)
```

![](02Up-Site-Bai_files/figure-markdown_github/unnamed-chunk-2-2.png)

``` r
is.factor(team)
```

    ## [1] TRUE

``` r
class(team)
```

    ## [1] "factor"

``` r
position_fac <- factor(position)
teamf <- count(team)
teamf
```

    ##      x freq
    ## 1  ATL   14
    ## 2  BOS   15
    ## 3  BRK   15
    ## 4  CHI   15
    ## 5  CHO   15
    ## 6  CLE   15
    ## 7  DAL   15
    ## 8  DEN   15
    ## 9  DET   15
    ## 10 GSW   15
    ## 11 HOU   14
    ## 12 IND   14
    ## 13 LAC   15
    ## 14 LAL   15
    ## 15 MEM   15
    ## 16 MIA   14
    ## 17 MIL   14
    ## 18 MIN   14
    ## 19 NOP   14
    ## 20 NYK   15
    ## 21 OKC   15
    ## 22 ORL   15
    ## 23 PHI   15
    ## 24 PHO   15
    ## 25 POR   14
    ## 26 SAC   15
    ## 27 SAS   15
    ## 28 TOR   15
    ## 29 UTA   15
    ## 30 WAS   14

``` r
n <- sum(teamf$freq)
rlfr <- teamf$freq/n
rlfr
```

    ##  [1] 0.03174603 0.03401361 0.03401361 0.03401361 0.03401361 0.03401361
    ##  [7] 0.03401361 0.03401361 0.03401361 0.03401361 0.03174603 0.03174603
    ## [13] 0.03401361 0.03401361 0.03401361 0.03174603 0.03174603 0.03174603
    ## [19] 0.03174603 0.03401361 0.03401361 0.03401361 0.03401361 0.03401361
    ## [25] 0.03174603 0.03401361 0.03401361 0.03401361 0.03401361 0.03174603

``` r
barplot(rlfr)
```

![](02Up-Site-Bai_files/figure-markdown_github/unnamed-chunk-3-1.png)

``` r
barplot(teamf$freq)
```

![](02Up-Site-Bai_files/figure-markdown_github/unnamed-chunk-3-2.png) This plot shows that the SD is significantly different.
