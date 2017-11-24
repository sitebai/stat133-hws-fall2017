---
title: "Clean scores dictionary"
author: "Site Bai"
date: "11/24/2017"
output: github_document
---

1. Title: `Clean scores dictionary.`  
2. Content: `Clean scores of rawdata of fictitious Stat 133 class.`  
3. Number of observations: `334`  
4. Number of attributes: `23`  
5. Description of data:  

* `columns HW1 to HW9`: homework assignments including 1 to 9, each 100points.
* `column ATT` :lab attendence,0 to 12.
* `column QZ1`: quiz1 scores, 12points.
* `column QZ2`: quiz2 scores, 12points.
* `column QZ3`: quiz3 scores, 12points.
* `column QZ4`: quiz4 scores, 12points.
* `column EX1`: exam1 scores, 80points.
* `column EX2`: exam2 scores, 80points.
* `column Homework`: the overall homework score obtained by dropping lowerest homework score,
and then averaging the remaining scores. 
* `column Quiz`: the overall homework score obtained by dropping lowerest homework score,
and then averaging the remaining scores.
* `column Overall`: the overall points obatined depends on following grading structure:    

##### -`10% Lab score `  
##### -`30% Homework score (drop lowest HW) `  
##### -`15% Quiz score (drop lowest quiz) `  
##### -`20% Test 1 score `  
##### -`25% Test 2 score`  
##### -`(Overall must be already in a scale 0 to 100)`  

* `column Grade` : the letter grade based on the following cutting points. A bracket [ means inclusion, and
a parenthesis ) means exclusion.   

##### -`Letter Overall Score`  
##### -`F [0 - 50)`  
##### -`D [50 - 60)`  
##### -`C- [60 - 70)`  
##### -`C [70 - 77.5)`  
##### -`C+ [77.5 - 79.5)`  
##### -`B- [79.5 - 82)`  
##### -`B [82 - 86)`  
##### -`B+ [86 - 88)`  
##### -`A- [88 - 90)`  
##### -`A [90 - 95)`  
##### -`A+ [95 - 100]`

6. Class of variables:

| Name          | Class         | Scale |
| ------------- |:-------------:| -----:|
| HW1-hw9       | numeric       |  100  |
| QZ1           | numeric       |   12  |
| QZ2           | numeric       |   18  |
| QZ3           | numeric       |   20  |
| QZ4           | numeric       |   20  |
| ATT           | numeric       |   12  |
| EX1           | numeric       |   80  |
| EX2           | numeric       |   90  |
| Test1         | numeric       |   100 |
| Test2         | numeric       |   100 |
| Lab           | numeric       |   100 |
| Homework      | numeric       |   100 |
| Quiz          | numeric       |   100 |
| Overall       | numeric       |   100 |
| Grade         | factor        |   A-F |

