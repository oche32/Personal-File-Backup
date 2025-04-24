[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/vsPf7w5z)
[![Open in Visual Studio Code](https://classroom.github.com/assets/open-in-vscode-718a45dd9cf7e7f842a935f5ebbe5719a5e09af4491e668f4dbf3b35d5cca122.svg)](https://classroom.github.com/online_ide?assignment_repo_id=12502335&assignment_repo_type=AssignmentRepo)
# 📝 W05 Summative"

⏲️ **Due Date**:

- 30 October 2023 at **12:00pm** UK time

If you submit after this date without an authorised extension, you will receive a [late submission penalty](https://info.lse.ac.uk/current-students/services/assessment-and-results/exams/exam-discipline-and-academic-misconduct).

Did you have an extenuating circumstance and need an extension? Send an e-mail to 📧 [Kevin](mailto:DSI.ug@lse.ac.uk?subject=DS105A%20-%20W05%20Summative%20Extension)

🎯 **Main Objectives:**

- Practice some more Git/GitHub
- Practice writing Python loops and functions

⚖️ **Assignment Weight**:


This assignment is worth 20% of your final grade.


**Do you know your CANDIDATE NUMBER? You will need it.**

> _"Your candidate number is a unique five digit number that ensures that your work is marked anonymously. It is different to your student number and will change every year. **Candidate numbers can be accessed using LSE for You.**"_ 

Source: [LSE](https://www.lse.ac.uk/accounting/study/New-Arrival/Exams-and-Assessments)


# 📝 Instructions

Read carefully, some details are new.

1. Go to our Slack workspace's `#announcements` channel to find a GitHub Classroom link entitled 📝 **W05 Summative**. Do not share this link with anyone outside this course!

2. Click on the link, sign in to GitHub and then click on the green button `Accept this assignment`.

3. You will be redirected to a new private repository created just for you. The repository will be named `ds105a-2023-w05-summative--yourusername`, where `yourusername` is your GitHub username. The repository will be private and will contain a `README.md` file with a copy of these instructions.

4. Take note of your LSE CANDIDATE NUMBER. You will need it in the next step. 

5. Create a Jupyter Notebook with the name: `<CANDIDATE_NUMBER>.ipynb`m replacing the text `<CANDIDATE_NUMBER>` with your actual LSE number. 

    For example, if your candidate number is `12345`, then your file should be named `12345.ipynb`.

6. **IMPORTANT** DO NOT identify yourself in your notebook in any way. This includes your name, your candidate number, your GitHub username, your e-mail address, etc. You might lose points if you do so.

    - Pay close attention to paths. If you use a path that contains your username (say `/Users/yourusername/...` or `C:\Users\yourusername\...`), this counts as identifying yourself. Use relative paths instead like `../data/...`.

7. Fill out this Jupyter Notebook file with all of your answers. Use headers, markdown text and code chunks to keep your work organised. This will make it easier for us to grade your work. You can read more about markdown for Jupyter [here](https://medium.com/analytics-vidhya/the-ultimate-markdown-guide-for-jupyter-notebook-d5e5abf728fd). 

8. **IMPORTANT:** Your notebook must be reproducible. That is, if we download your notebook, restart our Python Kernel and run it from top to bottom, we should not get an error and we should see the same results as you.

    - If you import any package other than the ones we've been using (pandas, requests, scrapy), please mention the package as well as the version number somewhere in your notebook.
    - If you had to create any folders

9. You will also be asked to create two CSV files. Put this file in the `data` folder.

10. Push this notebook as well as the `data/*.csv` files to your GitHub repository. You can push your changes as many times as you want before the deadline. We will only grade the last version of your assignment. _Having trouble using Git on your computer? You can always add the files via the GitHub web interface._

11. Read the section **How to get help and how to collaborate with others** at the end of this document.

## "What do I submit?"

You are expected to push two files to your GitHub repository.

- A Jupyter Notebook

- A CSV file named `schedule.csv` in the `data` folder.

- A CSV file named `agenda.csv` in the `data` folder.

You don't need to click to submit anything. Your assignment will be automatically submitted when you `commit` **AND** `push` your changes to GitHub. You can push your changes as many times as you want before the deadline. We will only grade the last version of your assignment. _Having trouble using Git on your computer? You can always add the files via the GitHub web interface._

# 📋 Your Tasks

What do we actually want from you?

## Part 1

- Scrap the list of events from the [CIVICA Schedule page](https://socialdatascience.network/#schedule)
- Produce a dataframe called `df_schedule` with the following columns:

| title | speaker | date | link |
| --- | --- | --- | --- |
| The title of the event | The speaker's name | The date of the event | The link to the event's page |

Save it to a CSV file named `schedule.csv` in the `data` folder of your repository.

## Part 2

Each event has its own page and there is usually an **Agenda** section. This agenda looks like a table:

![](/figures/civica_agenda.png)

Using your `df_schedule` as a reference point, your task will be to scrape the agenda of each event, represented by the rows of the dataframe, and produce a new dataframe called `df_agenda` with the following columns:

| event_link | talk_title | talk_speakers | talk_description |
| --- | --- | --- | --- |
| The link to the event's page | The title of the talk | The speaker's name | The description of the talk |


💡 **NOTE:** The column `event_link` will appear repeated for each talk that is part of the event. This is normal, and desired.

In the example above, the resulting table would look like this:

| event_title | talk_title | talk_speakers | talk_description |
| --- |  --- | --- | --- |
| https://socialdatascience.network/fall2023/sess2.html | Welcome Introduction | Prof. Nicolo' Cavalli, Bocconi | Setting the scene: Brief intro to the speaker and their talk |
| https://socialdatascience.network/fall2023/sess2.html | Seminar Session | Vincent Philipp Marohl (Columbia University) & Moritz Pfeifer (Leipzig University) | CentralBankRoBERTa: A Fine-Tuned Large Language Model for Central Bank |
| https://socialdatascience.network/fall2023/sess2.html | Research Discussion | Lead Institution | Q&A / Discussion on the research |
| https://socialdatascience.network/fall2023/sess2.html | Announcement |  | Upcoming seminar in the series and other announcements |


Leave cells empty if there is no information available. For example, the last row of the table above has no information on the `talk_speakers` column.

This data frame, `df_agenda`, will be saved as a CSV file named `agenda.csv` in the `data` folder of your repository.

# ✔️ How we will grade your work

We will not be extremely rigid on this very first summative. Therefore, it is possible to reach 100/100 marks if you do everything correctly.

## Criteria 01: Notebook Organisation (20 marks)

- Does your notebook look organised?
- Did you use appropriate headers and code chunks to keep your work organised? 
- Is it easy to follow your thought process? 
- Did you explain, using text, what you are trying to achieve at each step of your analysis?

If we feel like we can say yes to these questions, then you will get full marks for this criteria.

Tip: don't overdo it. You don't need to write a novel. Just enough to make it easy for us to follow your thought process.

## Criteria 02: Correctness of your answers (50 marks)**

This is simple. Did you follow all the steps we asked you to do? Did you do them correctly? 

We will not judge the efficiency of your code at this stage in the course.

If we feel like we can say yes to these questions, then you will get full marks for this criteria.

## Criteria 03: Above and beyond (30 marks)

We have to be very strict here.

Did you go beyond the expectations of the assignment and did some extra **that produced relevant insights** into the process of scraping the data or insights into the data itself? In other words, just doing some extra for the sake of it will not get you any marks. You need to do something extra that the markers found that was extremely insightful, creative, original and unexpected. 

It is extremely rare/nearly impossible to get full marks for this criteria. To merit full marks, your submission will have to make us go _"wow, this is really cool! Not even ChatGPT could have done it!"_ and it would be so good the New Yorker magazine would want to write a profile about you.

Earning a few marks is a little more common, but yet, difficult. To merit a few marks, your submission will have to make us go _"wow, this is really cool! I didn't know you could do that with Python!"_


# How to get help and how to collaborate with others


## 🙋 Getting help

You can post general coding questions on Slack, but you should not reveal code that is part of your solution. 

For example, you can ask:

- _"What is a good way to extract just the middle part of a string?"_
- _"How do I convert a string to a date?"_

You are allowed to share 'aesthetic' elements of your code, if they are not part of the core of the solution. For example, suppose you find a really cool new way to write a for loop. You can share that on Slack.

If we find that you posted something on Slack that violates this principle without realising, you won't be penalised for it - don't worry, but we will delete your message and let you know.

## 👯 Collaborating with others

You are allowed to discuss the assignment with others, to work alongside each other and to help each other. However, you are not allowed to share code or to copy code from others. Pretty much the same rules as above. Copying code from others is plagiarism and will be dealt with accordingly.

Aim to strike a balance: you want to be able to talk to others about programming in general, without getting too specific about the assignment. This is a good way to ensure your submission has your own personal touch (more likely to earn more marks) and to avoid getting into trouble.

## 🤖 Using AI help?

You are allowed to use Generative AI tools such as ChatGPT when doing this research -- as well as search online for help. If you do use it, however minimal use you made, you are asked to report the AI tool you used and add an extra section to your notebook to explain the extent to which you used it.

Note that, while these tools can be helpful, they tend to generate responses that sound convincing but are not necessarily correct. Another problem is that they tend to generate responses that are formulaic and repetitive; thus, limiting your chances of getting a high mark. When it comes to coding, these tools tend to generate code that is not very efficient, or that is very old and does not follow the principles we teach in this course.

To see examples of how to report the use of AI tools, see 🤖 [Our Generative AI policy](/2023/autumn-term/generative-ai.qmd).
