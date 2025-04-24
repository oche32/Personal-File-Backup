[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/iqH-z_aL)
# ✏️ W10 Summative

*Author: Dr Ghita Berrada*


⏲️ **Due Date**:

- 27 March 2025 at 5pm (London time)

If you update your files on GitHub after this date without an authorised extension, you will receive a [late submission penalty](https://info.lse.ac.uk/current-students/services/assessment-and-results/exams/exam-discipline-and-academic-misconduct).

Did you have an extenuating circumstance and need an extension? Send an e-mail to 📧 [Kevin](mailto:DSI.ug@lse.ac.uk?subject=DS202W%20-%20W07%20Summative%20Extension)

🎯 **Main Objectives:**

- Demonstrate your ability to write a report in Quarto Markdown
- Demonstrate your ability to fit a linear/logistic regression model
- Demonstrate your ability to interpret and evaluate the performance of a linear/logistic regression model
- Demonstrate your understanding of supervised learning techniques
- Demonstrate your ability to defend your model choices

⚖️ **Assignment Weight**:

This assignment is worth 30% of your final grade in this course.


<mark background-color="#960018">
30%
</mark>

<br/><br/>


> [!IMPORTANT]
> ## Do you know your CANDIDATE NUMBER? You will need it.
> _"Your candidate number is a unique five digit number that ensures that your work is marked anonymously. It is different to your student number and will change every year. **Candidate numbers can be accessed using LSE for You.**"_ 
> Source: [LSE](https://www.lse.ac.uk/accounting/study/New-Arrival/Exams-and-Assessments)



# 📝 Instructions

1. Go to our Slack workspace's `#announcements` channel to find a GitHub Classroom link. Do not share this link with anyone outside this course!

2. Click on the link, sign in to GitHub and then click on the green button `Accept this assignment`.

3. You will be redirected to a new private repository created just for you. The repository will be named `ds202w-2025-2024-w10-summative--yourusername`, where `yourusername` is your GitHub username. The repository will be private and will contain a `README.md` file with a copy of these instructions.

4. Recall what is your LSE CANDIDATE NUMBER. You will need it in the next step. 

5. Create your own `<CANDIDATE_NUMBER>.qmd` file with your answers, replacing the text `<CANDIDATE_NUMBER>` with your actual LSE number. 

You can create a `.qmd` file from a Jupyter notebook (i.e `.ipynb`) by going on the VSCode Terminal, making sure you are in the same directory as your Jupyter notebook (use the `pwd` to check which directory you're in and `cd` command to change directory if needed) and then typing the following command:

```zsh
quarto convert <CANDIDATE_NUMBER>.ipynb
```

where `<CANDIDATE_NUMBER>.ipynb` is the name of the Jupyter notebook you want to convert into `.qmd`

Also check out the [Quarto documentation](https://quarto.org/docs/tools/vscode-notebook.html) to better understand the conversion from `ipynb` to `qmd`.

And check out [this tutorial](https://education.launchcode.org/intro-to-professional-web-dev/appendices/terminal-commands/terminal-commands-tutorial.html) if you want to better understand the commands you can run on your VSCode terminal (e.g to change current directory).

You can also use the `.qmd` file you used in the W01 lab as a template. Just remove anything that is not relevant to this assignment. 

6. Then, replace whatever is between the `---` lines at the top of your newly created `.qmd` file with the following:

    ```yaml
    ---
    title: "DS202W - W10 Summative"
    author: <CANDIDATE_NUMBER>
    output: html
    self-contained: true
    jupyter: python3
    engine: jupyter
    editor:
      render-on-save: true
       preview: true
    ---
    ```

    Once again, replace the text `<CANDIDATE_NUMBER>` with your actual LSE CANDIDATE NUMBER. For example, if your candidate number is `12345`, then your `.qmd` file should start with:

    ```yaml
    ---
    title: "DS202W - W10 Summative"
    author: 12345
    output: html
    self-contained: true
    jupyter: python3
    engine: jupyter
    editor:
      render-on-save: true
      preview: true
    ---
    ```

8. Fill out the `.qmd` file with your answers. Use headers and code chunks to keep your work organised. This will make it easier for us to grade your work. Learn more about the basics of **markdown formatting** [here](https://quarto.org/docs/authoring/markdown-basics.html).

7. Use the `#help` channel on Slack liberally if you get stuck.  

9. Once you are done, click on the `Render` button at the top of the `.qmd` file. This will create an `.html` file with the same name as your `.qmd` file. For example, if your `.qmd` file is named `12345.qmd`, then the `.html` file will be named `12345.html`. 

    Ensure that your `.qmd` code is reproducible, that is, if we were to restart VSCode and run your notebook from scratch, from top to the bottom, we would get the same results as you did.

10. Push both files to your GitHub repository. You can push your changes as many times as you want before the deadline. We will only grade the last version of your assignment. Not sure how to use Git on your computer? You can always add the files via the GitHub web interface.

11. Read the section **How to get help and how to collaborate with others** at the end of this document.

## "What do I submit?"

You will submit two files:

- A Quarto markdown file with the following naming convention: `<CANDIDATE_NUMBER>.qmd`, where `<CANDIDATE_NUMBER>` is your candidate number. For example, if your candidate number is `12345`, then your file should be named `12345.qmd`.

- An HTML file render of the Quarto markdown file. To generate a render, the easiest way is to include these lines
  
```yaml
editor:
  render-on-save: true
  preview: true
```

in your `.qmd` header so that an HTML file is generated each time you preview your document (make sure you also have the Quarto extension installed in VSCode so that you do the preview by clicking on a button at the top right corner of the VSCode menu bar without having to use the Terminal!). Also, don't forget to add the line ```self-contained: true``` to your `.qmd` header, otherwise none of your plots will show!

Your `.qmd` header should look something like this:

```yaml
---
title: "✏️ W10 Summative"
author: <CANDIDATE_NUMBER>
format: html
self-contained: true
jupyter: python3
engine: jupyter
editor:
  render-on-save: true
  preview: true
---

```

- An HTML file render of the Quarto markdown file.

You don't need to click to submit anything. Your assignment will be automatically submitted when you `commit` **AND** `push` your changes to GitHub. You can push your changes as many times as you want before the deadline. We will only grade the last version of your assignment. Not sure how to use Git on your computer? You can always add the files via the GitHub web interface.

# 🗄️ Get the data

## What data will you be using?

You will be using two distinct datasets for this summative.

## Parts 1 and 2

The dataset, for this part, comes from the [replication package](https://www.openicpsr.org/openicpsr/project/194606/version/V1/view) of an academic paper [(Guan, Palma, Wu 2024)](https://doi.org/https://doi.org/10.1111/ehr.13305) that describes inflation, money and prices during the Yuan Dynasty era in China. The Yuan were a Mongol dynasty that ruled for only around a century (from 1260–1368), but they had a long-lasting influence on China's culture, economy, and politics. They were also the first political regime in history that pegged paper money to precious metals and the first that deployed fiat money as the sole legal tender. The successive Yuan rulers each introduced their version of paper money initially pegged to a different value of silver (hence inflation!). At the beginning of the dynasty, the paper money was exchangeable for silver. From 1276, the money was not fully backed by silver and, in 1310, the government began to issue pure fiat money, just like we use today. For further details, have look at the paper from [(Guan, Palma, Wu 2024)](https://doi.org/https://doi.org/10.1111/ehr.13305)

The dataset we have records an estimate of the consumer price index (CPI) from 1260 to 1355 as well as several factors that could have affected it e.g the number of disasters, the external warfare , unification warfare, rebellions, total warfare as well as the nominal money issues and imperial grants[^1]



**📚 Preparation**

1. Download the data by clicking on the button below. [^2]

<a href="yuan_inflation_data.dta" style="margin-left:2em;" download>
    <button class="button-61">Download Yuan dynasty inflation dataset (`.dta` file i.e Stata file)</button>
</a>

You can download the accompanying README file to check the meaning of the data variable:

<a href="README_yuan_inflation_data.txt" style="margin-left:2em;" download>
    <button class="button-61">Download Yuan dynasty inflation dataset README file</button>
</a>

Refer to [(Guan, Palma, Wu 2024)](https://doi.org/https://doi.org/10.1111/ehr.13305) for more information on the dataset and its context.

## Part 3

In this part, we leave China and the middle ages behind and we're squarely back to the UK and the 20th/21st century. In this part, we'll have a closer look at the setting of Bank of England interest rates! It is the single most important interest rate in the UK and has a wide ranging impact on the economy as a whole. Set too high and the economic activity grinds to halt, unemployment rates increase and the risk of recession/depression increases; set too low and the economy overheats and inflation rates climb too high (risk of walking or even galloping inflation). If you want to learn more about interest rates, you can visit the [Bank of England's page](https://www.bankofengland.co.uk/monetary-policy/the-interest-rate-bank-rate).

The Bank of England sets the interest rates periodically and relies on a number of indicators to do so. For the purpose of this exercise, you'll place yourself in the shoes of a financial analyst and try to predict based on quarterly indicators (i.e indicators in the three months up to the rate setting meeting) whether the interest rates will go up, down or stay the same.

The economic indicators we're looking at are as follows:


<table border="2" class="dataframe">
<thead>
<tr>
      <th><span data-qmd="Indicator"></span></th>
      <th><span data-qmd="Meaning"></span></th>
      <th><span data-qmd="Source"></span></th>
    </tr>
</thead>
<tbody>
<tr>
<td>
<strong>Indicator</strong>
</td>
<td>
<strong>Meaning</strong>
</td>
<td>
<strong>Source</strong>
</td>
</tr>
<tr>
<td>
Consumer Confidence Index (CCI)
</td>
<td> <quote>The Consumer confidence index (CCI) is a standardised confidence indicator providing an indication of future developments of households’ consumption and saving.<br/> The index is based upon answers regarding household’s expected financial situation, their sentiment about 
the general economic situation, unemployment and capability of savings. <br/>
An indicator above 100 signals a boost in the consumers’ confidence towards the future economic situation, as a consequence of which they 
are less prone to save, and more inclined to spend money on major purchases in the next 12 months.<br/> Values below 100 indicate a pessimistic attitude towards future developments in the economy, possibly resulting in a tendency to save more and consume less.<br/>
This indicator is measured as an amplitude adjusted index, long-term average = 100. </quote> 
</td>
<td>
[OECD](https://www.oecd.org/en/data/indicators/consumer-confidence-index-cci.html?oecdcontrol-cf46a27224-var1=GBR&oecdcontrol-b2a0dbca4d-var3=1997-01&oecdcontrol-b2a0dbca4d-var4=2024-12)
</td>
</tr>
<tr>
<td>
Consumer Prices Index<br/> including owner occupiers' <br/>housing costs (monthly estimates)
</td>
<td> <quote>CPIH is the most comprehensive measure of inflation. <br/>It extends CPI (consumer price index) to include a measure of the costs associated with owning, maintaining and living in one's own home, known as owner occupiers' housing costs (OOH), along with council tax</quote>
</td>
<td>[UK's Office for National Statistics](https://www.ons.gov.uk/economy/inflationandpriceindices/timeseries/l59c/mm23)</td>
</tr>
<tr>
<td>
GDP (monthly estimates)
</td>
<td>
The GDP is the standard measure of the value added created through the production of goods and services in a country during a certain period.
</td>
<td>
[UK's Office for National Statistics](https://www.ons.gov.uk/economy/grossdomesticproductgdp/datasets/gdpmonthlyestimateuktimeseriesdataset)
</td>
</tr>
<tr>
<td>
Exchange rates
</td>
<td>
We track GBP to EUR and GBP to USD monthly exchange rates
</td>
<td>
[Bank of England](https://www.bankofengland.co.uk/boeapps/database/fromshowcolumns.asp?Travel=NIxIRxSUx&FromSeries=1&ToSeries=50&DAT=RNG&FD=1&FM=Dec&FY=1974&TD=31&TM=Jan&TY=2025&FNY=&CSVF=TT&html.x=46&html.y=35&C=1D1&C=IN3&Filter=N)
</td>
</tr>
<tr>
<td>
10-year gilt yields
</td>
<td>
A 10-year gilt yield refers to the return (or interest rate) that investors receive when they buy a 10-year UK government bond (gilt) and hold it to maturity. It represents the annualized yield that an investor would earn over the bond’s life.
<br/>
Let's break things down further:
<br/><br/>
Government Bonds (or gilts) are issued by the UK government to borrow money. A 10-year gilt means the bond matures in 10 years. The yield is the effective return an investor gets from holding the bond. It’s influenced by:
<ul>
<li> The bond's fixed coupon rate (interest payments).</li>
<li> The market price of the bond (yields move inversely to prices).</li> 
</ul>

Why do gilt yields matter?
<br/>

It’s a key indicator of market expectations for economic growth and inflation.

Rising yields suggest higher borrowing costs and possibly higher interest rates.
Falling yields suggest lower interest rates and a preference for safer assets.

*Example:*

If the UK 10-year gilt yield is 4%, it means that, on average, investors demand a 4% annual return over the next 10 years for lending money to the UK government.
If the yield rises to 5%, it means investors require a higher return (possibly due to inflation fears or expectations of higher interest rates).
</td>
<td>
[Federal Reserve Bank of St-Louis](https://fred.stlouisfed.org/series/IRLTLT01GBM156N#)
</td>
</tr>
<tr>
<td>
Unemployment rate <br/>(aged 16 and over, seasonally adjusted): %
</td>
<td>
<quote>Unemployment measures people without a job who have been actively seeking work within the last four weeks and are available to start work within the next two weeks.<br/> The unemployment rate is not the proportion of the total population who are unemployed. <br/>It is the proportion of the economically active population (people in work and those seeking and available to work) who are unemployed.
</quote>
</td>
<td>
[UK's Office for National Statistics](https://www.ons.gov.uk/employmentandlabourmarket/peoplenotinwork/unemployment/timeseries/mgsx/lms/)
</td>
</tr>
</tbody>
</table>

<br/>

These indicators are contained in a first separate dataset (the economic indicators dataset that you can download below) and are recorded for every month from 01/01/1997 to 01/11/2024.

Aside from these indicators, you have a second (separate) dataset (obtained from the [Bank of England](https://www.bankofengland.co.uk/boeapps/database/Bank-Rate.asp)) the records the Bank Rates i.e base interest rates set by the Bank from 06/05/1997 to 06/02/2025 (it also contains a variable `rate_change` that indicates whether the interest rate went down (value -1), went up (value 1) or stayed the same (value 0) compared to the previous rate setting event).


**📚 Preparation**

1. Download the datasets by clicking on the buttons below.

<a href="economic_indicators_interest_rate_setting.csv" style="margin-left:2em;" download>
    <button class="button-61">Download economic indicators dataset (csv file)</button>
</a>

<br/>

<a href="BoE_interest_rates.csv" style="margin-left:2em;" download>
    <button class="button-61">Download dataset with Bank of England interest rates (csv file)</button>
</a>


# 📋 Your Tasks

**What do we actually want from you?**

## Part 1: Show us your `pandas` and `lets_plot` muscles! (10 marks)

You don't need to use a chunk for each question. Feel free to organise your code and markdown for this part.

1.  Load the data into a data frame called `yuan`. Freely explore the data on your own.

2. This dataset comes in clean format but let's explore it a bit and derive some insights from it before we do any modeling with it.

   a. What are the years with the top 10 highest number of total wars? How many of those years (and which ones) overlap with the years with the top 10 nominal money issues? 
   
   b. Similarly, what are the years with the top 10 highest number of disasters? How many of those years (and which ones) overlap with the years with the top 10 nominal money issues?
   
   c. Create a single plot that shows the evolution over time of CPI, total wars, disasters and nominal money issues (be mindful of variable scaling!). What does this plot tell you?

## Part 2: Create regression models (45 marks)

In this part, we focus on predicting `cpi`. 

As it was in the previous section, you don't need to use a chunk for each question. Feel free to organise your code and markdown for this part.

1. Create a baseline linear regression model:
   
   - Create the training and test sets:
  
      - create a `yuan_train` to contain data before 1327
      - create a `yuan_test` to contain data from 1327 onwards
   
   - Now, using **only** the `yuan_train` data as a starting point, create a linear regression model that predicts the **target variable**
   - How well does your model perform? Just as in the [lab on week 3](/2024/winter-term/weeks/week03/lab.qmd) and insights from the lectures, use the residuals plot and a metric of your choosing to justify your reasoning. Can you explain the performance change between the training and test set?
  
2. Now is your time to shine! Come up with your own feature selection or feature engineering or model selection strategy[^3] and try to get a better model performance than you had before.
Don't forget to validate your results using the appropriate resampling techniques!<br/> Whatever you do, this is what we expect from you:

   - Show us your code and your model.

   - Explain your choices (of feature engineering, model selection or resampling strategy)

   - Evaluate your model's performance. If you created a new model, compare it to the baseline model. If you performed a more robust resampling, compare it to the single train-test split you did in the previous question.

## Part 3: Create classification models (45 marks)

In this part, we'll focus on predicting `rate_change` contained in the Bank of England interest rates dataset.

1. Before you do any classification, you'll need to do a bit of data processing:
   
   - Download the Bank of England interest rates dataset and load it into a dataframe called `df`. Carefully inspect the dataset and check that rate setting events occur every once in a while. 
   - Now download the economic indicators dataset into another dataframe: your task is to assign to each row of `df` values of economic indicators from the last quarter i.e the average of each indicator for the last three months up to the date of the rate setting event. For e.g, if the rate setting event is on 06/05/1997, you will to average data for GDP for May 1997, April 1997 and March 1997 and do the same separately for the other indicators i.e exchange rates, 10-year gilt yield, unemployment rates, CPIH and CCI.

2. Create a baseline logistic regression model:
   
   - Split your data in training and test set (70% of the years for training set - be careful with the ordering!)
   - Use whatever metric you feel is most apt for this task to evaluate your model's performance. Explain why you chose this metric.
   - Explain what the regression coefficients mean in the context of this problem.

1. Now is your time to shine once again ! Come up with your own feature selection, feature engineering and/or model selection strategy and try to get a better model performance than you had before.
Don't forget to validate your results using the appropriate resampling techniques!
<br/> Whatever you do, this is what we expect from you:

   - Show us your code and your model.

   - Explain your choices (of feature engineering, model selection or resampling strategy)

   - Evaluate your model's performance. If you created a new model, compare it to the baseline model. If you performed a more robust resampling, compare it to the single train-test split you did in the previous question.


> [!IMPORTANT]
> **Principles to bear in mind for all parts!**
> 1. We've seen many models until now and you might be tempted to try and show us every single model you know, in particular in the questions calling upon you to improve model performance. **Don't!** <br/>
Resist the siren calls🧜‍♀️ and make resolute model choices. Model selection is a skill! So, **DO NOT TRY EVERY SINGLE MODEL UNDER THE SUN** to tackle to the questions. State your modeling hypotheses clearly, justify your choices and only choose a couple of models to try and solve the questions.
> 2. You are obviously allowed to use dimensionality reduction techniques i.e PCA/UMAP if you think it might help with your modeling (again justify their use if you do use them!). But you don't have to use them. This summative is mainly about **supervised learning techniques**.
> 3. Simply lining up code without explanation will not get you high grades. We expect you to justify your modeling choices (e.g why did you choose to use a particular model in the particular context of the problem you're solving? why is it uniquely suitable for the dataset/problem context? How did you set its parameters?) and to explain the model results and metrics in the context of the problem you're dealing with.




# ✔️ How we will grade your work

Following all the instructions, you should expect a score of around 70/100. Only if you go above and beyond what is asked of you _in a meaningful way_ will you get a higher score. Simply adding more code[^4] or text will not get you a higher score; you need to add interesting insights or analyses to get a distinction.

⚠️ You will incur a penalty if you only submit a `.qmd` file and not also a properly rendered `.html` file alongside it!

## Part 1: Show us your `pandas` and `lets_plot` muscles! (10 marks)

Here is a rough rubric for this part:

- **<4 marks:** You wrote some code but filtered the data incorrectly or did not follow the instructions.
- **4-6 marks:** You cleaned the initial dataframe correctly correctly, but you might have made some mistakes when tallying the number of rows per countries, calculating the median NO2 per type of area or your plot and conclusions for Task 5 are not correct.
- **7-9 marks:** You did everything correctly as instructed. Your submission just fell short of perfect. Your code or markdown could be more organised, or your answers were not concise enough (unnecessary, overly long text).
- **10 marks:** You did everything correctly, and your submission was perfect. Wow! Your code and markdown were well-organised, and your answers were concise and to the point.

## Part 2: Create regression models (45 marks)

Here is a rough rubric for this part:

- **<11 marks:** A deep fail. There is no code, or the code/markdown is so insubstantial or disorganised to the point that we cannot understand what you did.
- **11-21 marks:** A fail. You wrote some code and text but ignored important aspects of the instructions (like not using linear regression)
- **22-33 marks:** You made some critical mistakes or did not complete all the tasks. For example: your pre-processing step was incorrect, your model contained some data leakage (e.g using variables that define others to predict them), or perhaps your analysis of your model was way off.
- **34-38:** Good, you just made minor mistakes in your code, or your analysis demonstrated some minor misunderstandings of the concepts.
- **~39 marks:** You did everything correctly as instructed. Your submission just fell short of perfect. Your code or markdown could be more organised, or your answers were not concise enough (unnecessary, overly long text).
- **>39 marks:** Impressive! You impressed us with your level of technical expertise and deep knowledge of the intricacies of linear regression and other models. We are likely to print a photo of your submission and hang it on the wall of our offices.

## Part 3: Create classification models (45 marks)

Here is a rough rubric for this part:

- **<11 marks:** A deep fail. There is no code, or the code/markdown is so insubstantial or disorganised to the point that we cannot understand what you did.
- **11-21 marks:** A fail. You wrote some code and text but ignored important aspects of the instructions (like not using logistic regression)
- **22-33 marks:** You made some critical mistakes or did not complete all the tasks. For example: your pre-processing step was incorrect, your model contained some data leakage (e.g using variables that define others to predict them), or perhaps your analysis of your model was way off.
- **34-38:** Good, you just made minor mistakes in your code, or your analysis demonstrated some minor misunderstandings of the concepts.
- **~39 marks:** You did everything correctly as instructed. Your submission just fell short of perfect. Your code or markdown could be more organised, or your answers were not concise enough (unnecessary, overly long text).
- **>39 marks:** Impressive! You impressed us with your level of technical expertise and deep knowledge of the intricacies of the logistic function and other models. We are likely to print a photo of your submission and hang it on the wall of our offices.

# How to get help and how to collaborate with others


## 🙋 Getting help

You can post general coding questions on Slack but should not reveal code that is part of your solution. 

For example, you can ask:

- _"Does anyone know how I can create a logistic regression in `scikit-learn` with a `Pipeline`?"_
- _"Has anyone figured out how to do time-aware cross-validation??"_
- _"I tried using something like `pd.query("Date>'1997-05-06'")` but then I got an error "_ ([Reproducible example](https://stackoverflow.com/help/minimal-reproducible-example))
- _"Does anyone know how I can create a new variable that is the sum of two other variables?"_

You are allowed to share 'aesthetic' elements of your code if they are not part of the core of the solution. For example, suppose you find a really cool new way to generate a plot. You can share the code for the plot, using a generic `df` as the data frame, but you should not share the code for the data wrangling that led to the creation of `df`.

If we find that you posted something on Slack that violates this principle without realising it, you won't be penalised for it - don't worry, but we will delete your message and let you know.

## 👯 Collaborating with others

You are allowed to discuss the assignment with others, work alongside each other, and help each other. However, you cannot share or copy code from others — pretty much the same rules as above.

## 🤖 Using AI help?

You can use Generative AI tools such as ChatGPT when doing this research and search online for help. If you use it, however minimal use you made, you are asked to report the AI tool you used and add an extra section to your notebook to explain how much you used it.

Note that while these tools can be helpful, they tend to generate responses that sound convincing but are not necessarily correct. Another problem is that they tend to create formulaic and repetitive responses, thus limiting your chances of getting a high mark. When it comes to coding, these tools tend to generate code that is not very efficient or old and does not follow the principles we teach in this course.

To see examples of how to report the use of AI tools, see 🤖 [Our Generative AI policy](https://lse-dsi.github.io/DS202/2024/winter-term/generative-ai.html).

## References 

Guan, Hanhui, Nuno Palma, and Meng Wu. 2024. “The Rise and Fall of Paper Money in Yuan China, 1260–1368.” *The Economic History Review* 77 (4): 1222–50. [https://doi.org/https://doi.org/10.1111/ehr.13305](https://doi.org/https://doi.org/10.1111/ehr.13305).

[^1]: Imperial grants could be fixed annual and occasional (ad hoc) grants. According to [(Guan, Palma, Wu 2024)](https://doi.org/https://doi.org/10.1111/ehr.13305), <q>Fixed annual grants were usually set each year during an emperor's reign. There were also occasional imperial grants, typically occurring when an emperor was enthroned, when other Mongol nobles presented themselves before an emperor, or when emperors rewarded imperial bodyguards or other soldiers for their service. The early reign of Kublai coincided with the period of the strict silver standard (1260–75). During this time, imperial grants remained low and stable, with fixed grants occupying most of the total. However, Kublai granted more occasional grants from 1285 until the last year of his reign in 1294. Kublai's successors typically kept fixed imperial grants low, but occasionally they granted substantial grants. One of the primary reasons for this change was because of the politically volatile imperial power. From 1294 to 1333, nine emperors ascended the throne, each having reigned for an average of 4 years and some having been assassinated. To win the support of the Mongol nobles, emperors resorted to ad hoc grants. During the reign of the last Yuan emperor, Toghon Temür (enthroned in 1333), the tendency to issue substantial grants gradually ceased. Our findings are consistent with qualitative historical documentation and other studies on the Yuan's imperial grants.
The composition of the imperial grants over time [...] shows that paper money constituted the largest part of the imperial grants throughout the Yuan dynasty. While silver grants occupied approximately one-tenth of the total grants in the early Yuan period, their proportion diminished as the government loosened the silver standard.</q>

[^2]: Note that is a Stata file (you will encounter such proprietary files in "the wild" once in a while as a data scientist!). Check the `pandas` documentation on how to read Stata files.

[^3]: Feature engineering is creating new variables from existing ones. For example, you could create a new variable that results from a mathematical transformation of an existing variable.Or you could enrich your dataset with some other publicly available data.<br/>
Hint: Don't forget you are dealing with time series data😉.

[^4]: Hint: don't just write code, especially uncommented chunks of code. It won't get you very far. You need to explain the code results, interpret them and put them in context.
   























