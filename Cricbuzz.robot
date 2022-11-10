*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Checking Highest and Lowest
    open browser    https://www.cricbuzz.com/   firefox
    maximize browser window
    sleep   2s
    mouse over  xpath://a[@href="/cricket-team"]
    sleep   2s
    click element   xpath:(//a[@href="/cricket-team/india/2"])[1]
    sleep   2s
    click element   xpath://a[@title="India Cricket Team Results"]
    sleep   2s
    click element   xpath:(//a[@href="/cricket-scores/48457/ind-vs-wi-5th-t20i-india-tour-of-west-indies-2022"])[1]
    sleep   2s
    click element   xpath://a[@title="West Indies vs India, 5th T20I Scorecard"]
    sleep   2s

    ${HighestScorerName}     get text    xpath://a[@title="View profile of Shreyas Iyer"]
    ${HighestScore}     get text    xpath:(//div[@class="cb-col cb-col-8 text-right text-bold"])[3]

    ${LowestScorerName}     get text    xpath://a[@title="View profile of Kuldeep Yadav"]
    ${LowestScore}      get text    xpath:(//div[@class="cb-col cb-col-8 text-right text-bold"])[9]

    ${MaxWicketTakerName}   get text    xpath://a[@title="View profile of Ravi Bishnoi"]
    ${MaxWickets}   get text    xpath:(//div[@class="cb-col cb-col-8 text-right text-bold"])[35]

    ${LowestWicketTakerName1}   get text    xpath://a[@title="View profile of Hardik Pandya"]
    ${LowestWicketTakerName2}   get text    xpath://a[@title="View profile of Avesh Khan"]
    ${LowestWicketTakerName3}   get text    xpath://a[@title="View profile of Arshdeep Singh"]

    @{LowestWicketTakerList}    create list     ${LowestWicketTakerName1}, ${LowestWicketTakerName2}, ${LowestWicketTakerName3}

    ${LowestWicketsTaken}   get text    xpath:(//div[@class="cb-col cb-col-8 text-right text-bold"])[31]

    log to console  ${\n}Highest Scorer among Indian Batsmen is ${HighestScorerName} and his score is ${HighestScore} runs${\n}

    log to console  ${\n}Lowest Scorer among Indian Batsmen is ${LowestScorerName} and his score is ${LowestScore} runs

    log to console  ${\n}Highest Wicket Taker among Indian Bowlers is ${MaxWicketTakerName} and he took ${MaxWickets} wickets

    log to console  ${\n}Lowest Wicket Takers among Indian Bowlers are ${LowestWicketTakerList} and they took ${LowestWicketsTaken} wickets

    close browser



*** Keywords ***
