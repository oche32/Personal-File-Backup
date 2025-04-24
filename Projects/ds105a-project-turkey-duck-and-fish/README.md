[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/WKKzpWVj)

# 📝 DS105A Group Project 📝 

## ✈️ Analysis Topic: Flight Delay Analysis ✈️

--- 

### Overview

**The purpose of this repository is to the analyse flight delays: which airports have the most delays, which airlines have the most delays, how much delay occurs, etc.** We have scraped data from the Aviyair API and analyzed the data. This README file will provide an overview of what you can find in this repository, how to reproduce our analysis, the conclusions we have reached, and our contribution list. 

--- 

### Repository Structure

Here's a quick overview of the important files and directories in this repository:

- **`Code(src)`**: This folder contains the source code for our project, where you can find:  

    - **api request.ipynb** file: This file contains the code to collect the raw data from the API and produce a CSV file containing this raw data: **data.csv**.

    (*Note*: The raw data file **data.csv** contains 732,880 lines of data. We did not want to push large files to Github, so the file is compressed to **data.rar**, which can be found in the **/Data** folder.)  

    - **Data Filtration.ipynb** file: This file contains the code that filters the raw file **data.csv** to produce the final data frame: (**final_data.csv**). This is the final data that we use in our analysis. 

    - **pplot-jan27.ipynb** file: This file contains the code to our analysis of **final_data.csv** with **Matplotlib** and **Geopandas** to produce visualization graphs.  

- **`Data`**: This folder contains the compressed version of the raw data **data.rar** and other filtered data files (e.g. Delay.csv, Airport_IATA.csv) that are used to produce the final data that we use in our analysis.  

- **`Final Data`**: This folder contains our final data file: **final_data.csv**.

- **`docs`**: This folder includes the **index.md** file that contains the story of our website, and other necessary files for the production of our website.

- **`figs`**: This folder contains several png files that are different visualizations that we have produced through our analysis. These figures are included in our website alongide with their explanations. 

---

### Reproduction of the Analysis

To reproduce the scraping, analysis, and findings, follow these steps:

1. Access the repository: Either clone this repository using the git clone command on the terminal, or interact with it on GitHub.

2. Navigate to the **Code(src)** file and open the jupyter notebooks. Follow the process and comments within the notebooks to run the code and reproduce the analysis. (It is recommended to read the notebooks in this order: 1: api request.ipynb, 2: Data Filtration.ipynb, and 3: pplot-jan27.ipynb)  

3. Or alternatively, simply explore the Data/, Final Data/, and figs/ folders to view the comprehesively scraped and filtered data and the findings displayed in the figures.

---
### Conclusions 

xxx 

--- 

### Contribution List

Here is each member's contribution to the project: 

- **`Kylin Gao`**: Data Sourcing, Data Analysis and Visualization
- **`Chaoyang Feng`**: Data Filtration, Data Collection (API)
- **`Sissi Wang`**: Data Sourcing, Website Production
- **`Anka Uysal`**: Data Sourcing, Website Production

For any questions, please do not hesitate to reach out to us. 