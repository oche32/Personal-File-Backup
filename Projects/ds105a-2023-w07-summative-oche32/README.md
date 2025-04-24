[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/x0jlv1JK)
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=12685893&assignment_repo_type=AssignmentRepo)  

**This project is about scraping data from Wikipedia with the keyword "democracy", followed by some further analysis.**  
**Candidate number: 26508**  
**This Project is Using Kernal Python3.10.6**  
**Run this project in the following sequence: 1: Wikipedia_webscraping.ipynb, 2: Further_Extraction.ipynb, 3: Data_Analysis.ipynb.**  

## **<span style="font-size: 24px;">This project has 3 parts.<span>**  
Part 1 is mainly about collecting data about democracy from Wikipedia.   
Part 2 and Part 3 work on analyzing collected data.  

## **<span style="font-size: 24px;">Part 1</span>**  
The 1st part is scraping basic information about the keyword democracy. I scraped data from Wikipedia with an advanced search that has "democracy" inside titles. I targeted paths containing different types of information and saved all data into a CSV file called **brief_wikipedia_data.csv**   

For workflow details in part 1, open this file: **Wikipedia_webscraping.ipynb**

## **<span style="font-size: 24px;">Part 2</span>**  
While I did get some basic information, they are not enough for my analysis. Thus, I will further explore all websites.  

In **Further_Extraction.ipynb**. First I have attained the complete URLs to facilitate my web scraping.  
Then I found some information that might help my analysis, which I have stored in the folder **further data** A list of pieces of useful information are: the **last edit time** and **stubs**  

I have scraped data about the "last editing time of the article" and the "stub articles" from the 1300+ URLs collected in Part 1.  
Then I saved them as CSV files **all_stubs_data.csv** and **all_time_data.csv** for my part 3 data analysis.  

## **<span style="font-size: 24px;">Part 3</span>**  
In part 3, I have started my further analysis of data.  
There are 3 sections in part 3.  
The 1st section is the preparations.   
The 2nd section provides some information about **' average editing time', 'stubs probability', and 'frequency of countries appearing in stubs'** through analysis  
The 3rd section is an organized report of **my 3 interesting findings** about the data.  

## **Interesting findings** (more details available via Section 3 of Data_Analysis.ipynb)  
1: The average last editing date for all 1380 pieces of Wikipedia data that contains "democracy" inside their titles is **16, Sept., 2023**  
The expected editing time for a web in Wikipedia is **4 months**, but for our data, it is **less than 2.5 months**.  
This proves that **Democracy** is a popular topic.  

2: there is **25.3818%** that the article I collected is a stub (an article that needs further expanding/ more information).  

3: Country names **United States** and **Benin** appear most frequently in my 300+ stubs. For possible reasons see Section 3 of Data_Analysis.ipynb.