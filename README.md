---------------------------
-----------------------
# **STAFF DATA ANALYSIS WITH R**

------------------------
----------------------

## Overview
This project explores a dataset of staff members, examining various aspects such as department distribution, length of employment, sick leave days, and response times. Through visualisations and statistical analysis, meaningful insights about the staff's work patterns and behaviours are uncovered.

----------------
-------------

## 1. Distribution of Data

### a. Distribution of Staff Across Different Departments
![image](https://github.com/user-attachments/assets/40e5edd7-714a-4b6f-bfd8-88b7e320acfe)

*The Environment and Education departments have the highest number of staff members, while Heritage has the fewest.*

-------------------


### b. Distribution of Staff Based on Length of Employment
![image](https://github.com/user-attachments/assets/db18fee8-0b50-4fb1-9b0f-e98fce0a01ee)

*Most staff have been employed for 3–5 years, with "More than 10 years" being the least common category.*

-----------------------

### c. Distribution of Staff Based on Sick Leave Days
![image](https://github.com/user-attachments/assets/cd85a893-fe4b-417b-af88-30e49eae22f0)

*Most staff took less than 20 sick leave days, with a long tail indicating higher values for some.*

------------------------------------

### d. Distribution of Staff Based on Query Response Times
![image](https://github.com/user-attachments/assets/8818f8c6-f032-4b76-b977-9218772a5737)

*Most of the staff achieved the response target around 75% of the time.*

-------------------------------
----------------------

## 2. Descriptive Statistics for Each Variable

### Descriptive Statistics for the Staff Dataset
This table presents a summary of the staff dataset, highlighting important statistics for each variable.

| Variable         | Data Type   | Descriptive Statistics                       | Reason for the Statistics Used                                      |
|------------------|-------------|----------------------------------------------|---------------------------------------------------------------------|
| Department       | Nominal     | Count                                        | Count shows frequency in each category in the various departments.  |
| Time             | Ordinal     | Count, Percentage                            | Count and percentage show distribution and proportions of staff members based on their time of employment. |
| Sick Days        | Quantitative| Mean, Median, Standard Deviation             | Assesses central tendency and variability in the sick leave days which is a quantitative variable. |
| Response Target  | Quantitative| Mean, Median, Standard Deviation             | Assesses central tendency and variability in the response target which is also quantitative variable. |

---------------------

### i. Nominal Data (Department)
**Distribution of Staff Across Different Departments**

| Department  | Count | Percentage |
|-------------|-------|------------|
| Education   | 113   | 31.1%      |
| Environment | 125   | 34.4%      |
| Heritage    | 19    | 5.23%      |
| Housing     | 61    | 16.67%     |
| Welfare     | 45    | 12.30%     |

*Most staff are in the Environment and Education departments.*

------------------------

### ii. Ordinal Data (Time)
**Distribution of Staff Across Different Employment Duration Categories**

| Employment Duration | Count | Percentage |
|---------------------|-------|------------|
| Less than 1 year    | 66    | 18.2%      |
| 1 year              | 79    | 21.8%      |
| 2 years             | 64    | 17.6%      |
| 3-5 years           | 92    | 25.3%      |
| 6-10 years          | 44    | 12.1%      |
| More than 10 years  | 18    | 5.0%       |

*The most common employment duration is 3-5 years, while the least common is more than 10 years.*

-------------------------

### iii. Quantitative Data Summary of Sick Days and Response Target Statistics

| Statistic          | Sick Days | Response Target |
|--------------------|-----------|-----------------|
| Mean               | 24.06     | 75.68           |
| Median             | 15        | 75.6            |
| Standard Deviation | 22.84     | 3.23            |

*On average, employees took about 24 sick days, with a typical value of 15 days. For response times, staff responded in an average of 75.7% of cases, with most responses around 75.6%. The variation in sick days is high, while response times are quite consistent.*

---------
-------

## 3. Response Target Statistics by Department and Employment Duration

| RESPONSE TARGET GROUP | Mean  | Median | Standard Deviation |
|-----------------------|-------|--------|--------------------|
| **Department**        |       |        |                    |
| Education             | 75.63 | 75.4   | 3.43               |
| Environment           | 75.40 | 75.3   | 2.64               |
| Heritage              | 75.12 | 75.4   | 3.53               |
| Housing               | 76.13 | 76.2   | 3.76               |
| Welfare               | 76.24 | 75.8   | 3.33               |
| **Employment Duration (Time)** |       |        |                    |
| Less than 1 year      | 73.79 | 74.1   | 2.61               |
| 1 year                | 73.50 | 73.7   | 2.51               |
| 2 years               | 76.54 | 76.1   | 2.62               |
| 3-5 years             | 76.47 | 76.1   | 2.88               |
| 6-10 years            | 77.47 | 77.2   | 2.51               |
| More than 10 years    | 80.82 | 80.5   | 1.87               |

*Staff members tend to respond faster to queries as they gain more work experience, with a notable increase after two years of employment. Staff with "More than 10 years" experience show a lower standard deviation (1.87), reflecting more consistent response times compared to higher variability in less experienced groups. Response rates are generally similar across departments, with slight variations, as the Housing and Welfare departments show marginally higher response targets.*

-------

-----

## 4. Response Target by Employment Duration
![image](https://github.com/user-attachments/assets/c3b434b0-7c25-42d9-965c-8f6718a77826)

*The box plot shows how quickly employees respond to queries based on their years of experience, allowing us to see the range and normal response times for each group. Employees generally improve their response times to queries as they gain more work experience, with a notable increase after two years of employment.*

- **Reason for Choosing Box Plot:** *The box plot is effective because it clearly displays the distribution of response times, highlighting the median and variability within each experience group, making it easy to compare performance across different durations.*

-------
-----

## 5. Relationship Between Sick Days and Response Target
![image](https://github.com/user-attachments/assets/3bd2f3b7-5d9e-4195-ba5b-2055f071240b)

*The scatter plot shows that there is no strong or consistent relationship between sick days and response target. The trend line is relatively flat, indicating that the number of sick days does not significantly impact employees' response targets.*

- **Reason for Choosing Scatter Plot:** The scatter plot is ideal for visualising relationships between two variables. In this case, each dot represents an employee, making it easy to spot trends – or, as shown here, the lack of a significant pattern.

---------------
-------------
-------------

## **Conclusion**
- The Environment and Education departments have the highest number of staff members, while Heritage has the fewest.
- Most staff have been employed for 3–5 years, with "More than 10 years" being the least common category.
- On average, employees took about 24 sick days, with a typical value of 15 days.
- Staff responded to queries in an average of 75.7% of cases, with most responses around 75.6%.
- Staff members tend to respond faster to queries as they gain more work experience, with a notable increase after two years of employment.
- The scatter plot indicates that the number of sick days does not significantly impact employees' response targets.

*These findings can inform better management practices and contribute to a more efficient and supportive work environment.*

------
--------

# THANK YOU 

--------
-------
