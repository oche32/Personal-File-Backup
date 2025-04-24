# ST207 Group Project - AT2024

## Group name

Weather_db

## Topic (database application)

Weather trends in London using historical weather data.

## Data sources

* This project will rely mainly on APIs as data sources. And we are primarily considering using MongoDB as database. We plan to use the OpenWeather API as our main data source, followed by other APIs as potential supplements.

There are 3 reasons for choosing the OpenWeather API:

1. It is comprehensive. The API contains a huge amount of historical data over a long period of time, and covers many different topics to explore. Some of them are not even "traditional weather topics", e.g. air pollution, fire weather index, solar irradiance.

2. We contacted OpenWeather API for our student project and were granted access to a more advanced API subscription called Developer Pack for free (Normally cost 140GBP/month). It offers access to 3000 calls per minute and 100,000,000 calls per month. We can also access the historical data we want.

3. OpenWeather aggregates multiple data sources from trusted weather stations, satellite data and models such as GFS. And it works with trusted sources like NOAA (National Oceanic and Atmospheric Administration), which strengthens the reliability of its weather data.

~~We have been exploring how to connect to the OpenWeather API, and have successfully completed a trial to obtain air pollution data for London from 2022 to 2023.  And we have checked the data structure. But it is true that we have not tried all the features of this API, which means that some of the data frame might be strange or not suitable for our database. Besides, the developer package also has certain restrictions that prevent us from accessing certain data. We will investigate these issues later and see if we can use other API sources for our database as well.~~

We have fully explored OpenWeather API, and have succssfully connect to almost all its avaibale services, and are confident that it could provide enough data for our project 

URL:
* https://openweathermap.org/api
* https://openweathermap.org/price
* https://openweathermap.org/history-bulk

## Proposed use cases and queries

* ~~Use cases: Tourism Planning, Agriculture / Farming~~  
* ~~Queries:~~
- ~~sunshine time in London~~
- ~~air pollution in London~~
- ~~the change in average temperature per month in London~~
- ~~raining phenomenon in London~~

Use cases: using data collected to help farms that are located at rural areas of Greater London (including Kent, Essex, Hertfordshire...).  The ultimate goal is to give recommendations in what kind of crops should be considered to plant.  

Queries:  

1. We will look into the seasonal/montly/yearly amount of rain/precipitation, analyze the overall rain trend in those areas around London, and give advice on what crops should be considered in planting.  (We may also include humidity data in analysis.)  

2. based on the same logic, we will look at the data about solar radiation, analyze the trend of the sunshine, and give advice on what crops should be considered. This will be combined with the raining data.   

3. we will Look at the seasonal/montly/yearly temperature change in areas around London.  

4. we will Look at the polution data. Despite OpenWeather provides us with many types of polution data, since our project is about agriculture, we will primaryly consider Ozone (O3) and PM2.5, which we have verified OpenWeather can provide data about these. The reason for choosing these is because they have bigger impact on farming compared to other pollution sources. They both impact on Photosynthesis Reduction, which is the most crucial reaction for the growth of crops. So we will aggregately consider these two pollution sources.  

I also understood your meaning of being "dynamic" when using database, we will focus on designing queries and use cases that explore the data more deeply, which includes looking for patterns, trends over time, comparisons between different periods or groups, and other analytical insights.  

## Feedback

The proposed database is relevant and close to a real scenario, based on a very known data source/service. As a general comment, you may prioritise data that allows for more analytical queries, such as patterns, evolution of a given attribute over time, any groups or clusterings that allow for window functions or similar, and other "dynamic" aspects of the database. You should avoid any static queries, such as retrieving basic information from tables.

Some points to observe/revise:  
* you managed to get access to OpenWeather and run a trial, which is fine as a proof-of-concept. It would be nice to fully understand all available data before issuing requests, so you save your allowance for your real work.
* the mentioned use cases are too generic and do not comprise uses cases per se. You should pick one scenario, let's say, tourism planning or farming, and then identify use cases (or typical queries) associated with them. What about "smart farming" and then check how OpenWeather data can be used in this context?
* you mentioned about fire weather index and solar irradiance. What about these scenarios as well?
* about the proposed queries: the first seems static, as you will look at sunshine time in London and this is seasonal, thus relatively known across the year. Questions 2 and 3 can be a bit dynamic, as they explore changes in temperature and pollution over time. They are fine provided you can work with a representative amount of data and, desirably, across different regions/boroughs in London. Question 4 is not clear: what do you mean by "phenomenon" here?

## Decision: resubmit

Edit this file on GitHub to: (i) better identify a scenario/context, and (ii) for the chosen context, five queries that you think relevant. It's ok if you change them a little bit throughout the project, based on your exploration of OpenWeather data and any other data sources or modifications to your use cases. You may consider any publications using OpenWeather data that can be helpful in this context. You can read about "smart farming" [here](https://ieeexplore.ieee.org/document/10255153).

Deadline: 16/12, noon.

<hr>

## Feedback (17/12)

* Data sources are still ok.
* All queries are overall fine. Thanks for clarifying all points. You could consider different crops and compare them against some metrics, such as temperature, humidity, seasonal factors (rain, snow, dry weather etc) and other dynamic aspects. If any spatial data is available, you can try some visualisations about crop evolution vs area coverage, proximity to water sources or transportation networks.

## Decision: approved
