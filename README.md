# womens-march
This is a place to join and analyze data related to the Women's Marches. Potentially this can lead to further joining and analysis of data on resistance to Trump and support for rights or issues that Trump opposes, as the Scientists' March on Washington (and possibly others) are discussed about and planned.

**Slack:** [#womens-march](https://datafordemocracy.slack.com/messages/womens-march/)

[**Project Leads:**](https://github.com/Data4Democracy/read-this-first/blob/master/lead-role-description.md) @chris_dick, @nick, @margaret

**Maintainers (people with commit access)**: TBD

**Project Description:** The purpose of this project is to understand geographic, messaging, and sentiment patterns around the Women's March as well as ongoing resistance to Trump as he opposes supporting certain issues.

The Women's March was the largest protest there has been in US History and occurred during a time when technology facilitates the movement of information and people more quickly and cheaply. Because of this, understanding the march through digital data and understanding key issues around the event can help to shed light on how people are responding to the current political climate in a more technology-driven environment. We hope to explore Twitter data that has been pulled, crowd estimates, spatial data, as well as other types of data that we can collect like survey, news, or other social media data, with goals of making insights gained from analysis known to the public. Questions we've started to ask are

* In what cities did people march?
* How many people marched in each city?
* What are the top ranking topics/issues in tweets related to #womens-march?
* Do topics tweeted about differ by city?
* What are other hashtags that people used with #womens-march?
* From where were people tweeting about #womens-march?
* How do these topical and geographic trends relate to data from the Status of Women and issues that affect women?

In conducting this research, we hope to gain new insights and understand the Women's March through data and data visualizations rather than just through news, pictures, stories, and signs.

## Getting started

### Things you should know about
* **"First-timers" are welcome!** Whether you're trying to learn data science, hone your coding skills, or get started collaborating over the web, we're happy to help. *(Sidenote: with respect to Git and GitHub specifically, our [github-playground](https://github.com/Data4Democracy/github-playground) repo and the [#github-help](https://datafordemocracy.slack.com/messages/github-help/) Slack channel are good places to start.)*
* **We've got (GitHub) Issues.** Ready to dive in and do some good? Check out our issues board. Issues are how we officially keep track of the work we're doing, what we've done, and what we'd like to do next. You can identify different issue types by their tags:
  * `first-pr`: smaller issues to cut your teeth on as a first-time contributor
  * `beginner-friendly`: issues suitable for those with less experience or in need of mentorship
* **We believe good code is reviewed code.** All commits to this repository are approved by project maintainers and/or leads (listed above). The goal here is *not* to criticize or judge your abilities! Rather, sharing insights and achievements this way ensures that we all continue to learn and grow. Code reviews help us continually refine the project's scope and direction, as well as encourage the discussion we need for it to thrive.
* **This README belongs to everyone.** If we've missed some crucial information or left anything unclear, edit this document and submit a pull request. We welcome the feedback! Up-to-date documentation is critical to what we do, and changes like this are a great way to make your first contribution to the project.

### Currently utilized skills
Take a look at this list to get an idea of the tools and knowledge we're leveraging. If you're good with any of these, or if you'd like to get better at them, this might be a good project to get involved with!
* **R** (analysis, R Markdown notebooks, visualization)
* **Python 3** (scripting, analysis, Jupyter notebooks, visualization)
* **Data cleaning**
* **Data analysis**
* **Data visualization**


## FAQ and other useful info
### Downloading this repository
To download the code and data inside this repository, you'll need [Git](https://git-scm.com/). Once you've got the necessary tools, open a command prompt and run `git clone https://github.com/data4democracy/womens-march.git` to start downloading your own working copy. Once the command finishes, you should see a new `womens-march` directory in the current directory's file listing. That's where you'll find it!

### Project structure (or, "how do I find `thing`?")
* **Source code and notebooks**: For now, you'll find these in the repository's root directory. This will probably change in the future as we accumulate more files.
* **Data files**: All data files are located in the `/data` directory. At the moment, there is no further hierarchy beyond this; again, as we accumulate more data, this is likely to change.

### Performing data analysis
There are many ways to analyze the data in this repository, but "notebook" formats like [Jupyter](http://jupyter.org/install.html) and [R Markdown](http://rmarkdown.rstudio.com/r_notebooks.html) are the most common. The setup process for these tools is in-depth enough to be outside the scope of this README, so please refer to documentation at the aforementioned links if necessary. If something isn't working quite right for you, that's okay! Continue reading to see how you can reach out for assistance.

### Talking to people/asking for help
If you have questions or you'd like to discuss something on your mind, reach out to us in the [#womens-march](https://datafordemocracy.slack.com/messages/womens-march/) channel on Slack. Project leads and maintainers are available for troubleshooting, brainstorming, mentorship, and just about anything else you might need.

### System requirements (suggested)
* **Git** (check out the [github-playground](https://github.com/data4democracy/github-playground) repository if you need a good place to get accustomed)
* **An analytical language of your choice** (Python, R, Julia, etc.)
* **Python 3** (for Jupyter/`.ipynb` notebook files)
* **RStudio** (for R Markdown/`.Rmd` notebook files)

## Completed goals
* **Twitter Data** Pulled streaming Twitter data with hashtags and created S3 output.
* **Twitter Data from data.world** Downloaded dataset that includes tweets and locations from data.world (https://data.world/wendyhe/tweets-on-womensmarch-and-maga)
* **Crowd Estimate Data from data.world** Downloaded dataset that includes crowd estimates and latitude longitude for each city from data.world. (https://data.world/carlvlewis/womens-marches-crowd-sizes)
* **Crowd Estimate Data from data.world** Mapped data

## To be completed
* **Twitter Data** Clean Twitter data. Analyze and find trends in Twitter data.
* **Status of Women Data** Clean and prepare data. Analyze and link to crowd estimates or Twitter topics.
* **Visualize/Analyze** Visualize data spatially or through tools for text data.
* **More questions/data** Refine questions/ask more questions and find/pull other datasets to broaden the scope.
* **Storytell** Report on findings and tell a story around the data.
