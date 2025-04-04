##### Install and Load important libraries
install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")
library(readr)
library(dplyr)
library(ggplot2)

##############################

# Set the working directory
setwd("C:/Users/DORIS/Downloads")

# Read the CSV file
df <- read.csv("assessment-1-k2436512-1.csv")


##########################################################

# 1. Distribution of Staff by Department (categorical variable)

# Create the bar plot for department distribution

ggplot(df, aes(x = department)) +
  geom_bar(fill = "steelblue") +
  geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
labs(title = "Distribution of Staff by Departments",
       x = "Department",
       y = "Number of Staff") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5))

# Save the plot
ggsave("distribution_of_staff_by_departments.jpeg", width = 10, height = 6, dpi = 300, device = "jpeg")



# 2. Distribution of Staff by Employment years(Time) 
 
# Convert 'time' to a factor with specified levels
df$time <- factor(df$time, levels = c("Less than 1 year", "1 year", "2 years", "3-5 years", "6-10 years", "More than 10 years"))

# Create the plot
ggplot(df, aes(x = time)) +
  geom_bar(fill = "skyblue") +
  geom_text(aes(label = ..count..), stat = "count", vjust = -0.5) +
  labs(title = "Distribution of Staff by Employment Years",
       x = "Employment Years",
       y = "Number of Staff") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5))
ggsave("distribution_of_staff_by_employment.jpeg", width = 10, height = 6, dpi = 300, device = "jpeg")




# 3. Distribution of Query Response Time (quantitative variable)
ggplot(df, aes(x = response_target)) +
  geom_histogram(binwidth = 2, fill = "#4c9f70", color = "orange") +  
  labs(title = "Distribution of Query Response Time",  
       x = "Response Target (%)",
       y = "Number of Staff") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),  
  )

ggsave("distribution_of_staff_by_query_response_time.jpeg", width = 10, height = 6, dpi = 300, device = "jpeg")



# 4. Distribution of Staff by Full-Time Employment Duration

# Convert 'time' to a factor with specified levels
df$ftime <- factor(df$ftime, levels = c("Less than 1 year", "1 year", "2 years", "3-5 years", "6-10 years", "More than 10 years"))

ggplot(df, aes(x = ftime)) +
  geom_bar(fill = "purple") +
  labs(title = "Distribution of Staff by Full-Time Employment Duration",
       x = "Full-Time Employment Duration",
       y = "Number of Staff") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5))

ggsave("distribution_of_staff_by_full-time_employment_duration.jpeg", width = 10, height = 6, dpi = 300, device = "jpeg")




# 5. Distribution of Staff by Sick Days Leave (quantitative variable)
ggplot(df, aes(x = sick_days)) +
  geom_histogram(binwidth = 10, fill = "orange", color = "white") +
  labs(title = "Distribution of Staff by Sick Leave Days",
       x = "Number of Sick Leave Days",
       y = "Number of Staff") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),  
  )

ggsave("distribution_of_staff_by_sick_leave_days.jpeg", width = 10, height = 6, dpi = 300, device = "jpeg")





## A table (or tables) of appropriate descriptive statistics for each of the four variables. 

# Calculate frequencies and mode
dept_stats <- df %>%
  group_by(department) %>%
  summarise(
    Frequency = n(),
    Mode = department[1]
  )

# Create the table
dept_table <- knitr::kable(dept_stats, caption = "Department Statistics")
print(dept_table)


# For Department (nominal)
dept_summary <- df %>%
  group_by(department) %>%
  summarise(count = n()) %>%
  mutate(percentage = count / sum(count) * 100)

print(dept_summary)


# For Time
time_summary <- df %>%
  group_by(time) %>%
  summarise(count = n()) %>%
  mutate(percentage = count / sum(count) * 100)

print(time_summary)

# For FTime
ftime_summary <- df %>%
  group_by(ftime) %>%
  summarise(count = n()) %>%
  mutate(percentage = count / sum(count) * 100)

print(ftime_summary)


# Calculate mean, median, and standard deviation
quant_stats <- df %>%
  summarise(
    Sick_Days_Mean = mean(sick_days),
    Sick_Days_Median = median(sick_days),
    Sick_Days_SD = sd(sick_days),
    Response_Target_Mean = mean(response_target, na.rm = TRUE),
    Response_Target_Median = median(response_target, na.rm = TRUE),
    Response_Target_SD = sd(response_target, na.rm = TRUE)
  )

# Create the table
quant_table <- knitr::kable(t(quant_stats), col.names = c("Mean", "Median", "Standard Deviation"), caption = "Quantitative Data Statistics")
print(quant_table)



# 3. A table of appropriate statistics for response_target, comparing the groups in department and in time.

# Calculate statistics for response_target by department
dept_stats <- df %>%
  group_by(department) %>%
  summarise(
    Mean = mean(response_target, na.rm = TRUE),
    Median = median(response_target, na.rm = TRUE),
    SD = sd(response_target, na.rm = TRUE)
  )

# Calculate statistics for response_target by time
time_stats <- df %>%
  group_by(time) %>%
  summarise(
    Mean = mean(response_target, na.rm = TRUE),
    Median = median(response_target, na.rm = TRUE),
    SD = sd(response_target, na.rm = TRUE)
  )

# Combine the results into a single table
result_table <- bind_rows(
  mutate(dept_stats, Group = "Department"),
  mutate(time_stats, Group = "Time")
)

# Reorder columns
result_table <- result_table %>%
  select(Group, department, time, Mean, Median, SD)

# Print the table
print(result_table)
dept_statist <- df %>%
  group_by(department) %>%
  summarise(
    mean = mean(response_target, na.rm = TRUE),
    median = median(response_target, na.rm = TRUE),
    SD = sd(response_target, na.rm = TRUE)
  )



# 4. An appropriate graph format, showing response_target statistics for each group in time. 

# Create the box plot
ggplot(df, aes(x = factor(time, levels = c("Less than 1 year", "1 year", "2 years", "3-5 years", "6-10 years", "More than 10 years")), 
               y = response_target, fill = time)) +
  geom_boxplot() +
  labs(title = "Response Target by Employment Duration",
       x = "Employment Duration",
       y = "Response Target") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0.5)) +
  scale_fill_brewer(palette = "Set3")

# Save the plot
ggsave("response_target_boxplot.jpeg", width = 10, height = 6, dpi = 300, device = "jpeg")




##  5. Relationship Between Sick Days and Response Target

ggplot(df, aes(x = sick_days, y = response_target)) +  # Ensure column names are lowercase if needed
  geom_point(color = "blue", alpha = 0.6, size = 3) +  # Single color for points, added size for clarity
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed", color = "black") +  # Dashed trend line
  labs(
    title = "Relationship Between Sick Days and Response Target",
    x = "Sick Leave Days",
    y = "Response Target (%)"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10)
    
  )

ggsave("sick_days_response_target_scatter.jpeg", width = 10, height = 6, dpi = 300, device = "jpeg")








###################################################
##### Other options for 5 #############

library(ggplot2)

# Create the scatter plot 
# Set the levels for 'time' in ascending order
df$time <- factor(df$time, levels = c("Less than 1 year", "1 year", "2 years", "3-5 years", "6-10 years", "More than 10 years"))

# Define a custom color palette with shades of green arranged by deepness
color_palette <- c("Less than 1 year" = "#A0C4E1",   # Light green
                   "1 year" = "#3498DB",           # Medium light green
                   "2 years" = "#F28E8E",          # Medium green
                   "3-5 years" = "#C0392B",        # Darker green
                   "6-10 years" = "#41ae76",       # Even darker green
                   "More than 10 years" = "#005824") # Darkest green

ggplot(df, aes(x = sick_days, y = response_target)) +
  geom_point(aes(color = time), size = 3, alpha = 0.8) +  # Increase size of points
  labs(title = "Relationship Between Sick Days and Response Target",
       x = "Sick Days",
       y = "Response Target (%)") +
  theme_minimal() +
  scale_color_manual(values = color_palette) +  # Use custom color palette
  theme(axis.text.x = element_text(angle = 0, hjust = 1),
        plot.title = element_text(hjust = 0.5))

ggsave("sick_days_response_target_scatter.jpeg", width = 10, height = 6, dpi = 300, device = "jpeg")

