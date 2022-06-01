
### ----------------------------------------------------------------------------
### --- DataKolektiv DATA SCIENCE SUMMER SCHOOL 2022
### --- MACHINE LEARNING IN R
### --- Week 1. Introduction to R for ML
### --- author: Goran S. Milovanović, Phd
### --- DataKolektiv, Chief Scientist/Owner
### --- DataKolektiv, 2022.
### --- script: 03_controlflow_functional.R
### --- description: control flow and functional programming in R
### --- license: GPL-3.0 license
### --- https://www.gnu.org/licenses/gpl-3.0.html

# - data_dir
data_dir <- paste0(getwd(), "/_data/")

# - elementary, dear Watson:
for (a in 1:10) print(a)
# - code blocks
for (i in 1:100) {
  print(sqrt(i))
}
# - function call in iterations
cities <- c('NYC', 'Belgrade', 'Rome', 'Berlin')
for (x in 1:length(cities)) {
  print(
    paste0("This is a large city: ", 
           cities[x])
  )
}

# - when to use for loops, and when not
numbers <- numeric()
for (i in 1:100) {
  numbers[i] <- i
}

# - it's a vectorized language, right?
numbers <- 1:100

# - look:
lF <- list.files(data_dir)
lF <- lF[grepl("data_chunk", lF)]
data_set <- lapply(paste0(data_dir, lF),
                   read.csv, header = T, stringsAsFactors = F)
data_set[[1]]
data_set[[2]]

# - slow with for loop:
# - list files
lF <- list.files(data_dir)
lF <- lF[grepl("data_chunk", lF)]
data_set <- list()
# - iterate:
for (i in 1:length(lF)) {
  data_set[[i]] <- read.csv(paste0(data_dir, lF[i]), 
                           header = T, 
                           stringsAsFactors = F)
}
data_set[[2]]

# - faster, if you plan the size of your
# - data structures:
# - list files
lF <- list.files(data_dir)
lF <- lF[grepl("data_chunk", lF)]
# - how many files?
num_files <- length(lF)
# - prepare a list to store the dataframes
data_set <- vector(mode = "list", length = num_files)
# - iterate:
for (i in 1:num_files) {
  data_set[[i]] <- read.csv(paste0(data_dir, lF[i]), 
                           header = T, 
                           stringsAsFactors = F)
}
data_set[[1]]

# - put them together w. functional Reduce()
data_set <- Reduce(rbind, data_set)

# - plan the size of your data structures
emptyList <- vector(mode = "list", length = 4)
emptyList

# - more loops: while
counter <- 0
while (counter <= 100) {
  counter <- counter + 1
  if (counter %% 10 == 0) {
    print(counter)
  }
}

# - decisions
num_rows <- dim(data_set)[1]
if (num_rows >= 10000) {
  print("data_set have more than 10,000 rows!")
} else {
  print("data_set is a very small dataset.")
}

# - nesting decisions
num_rows <- dim(data_set)[1]
num_cols <- dim(data_set)[2]
if (num_rows >= 100) {
  print("data_set have more than 100 rows!")
  if (num_cols > 10) {
    print("And it has more than ten columns!")
  } else {
    print("But it has less than ten columns!")
  }
} else {
  print("data_set is a very small dataset.")
  if (num_cols > 10) {
    print("And it has more than ten columns!")
  } else {
    print("But it has less than ten columns!")
  }
}

# - chain if... else
this_number <- 11
if (this_number > 10) {
  print("This number is less than ten...")
} else if (this_number < 5) {
  print("This number is less than five.")
}

# - switch
this_animal <- 'dog'
switch(this_animal,
       "dog" = "It's a dog!",
       "elephant" = "It's an elephant!", 
       "cat" = "Meow!", 
       "tiger" = "A tiger? In Africa?")
this_animal <- 'cat'
switch(this_animal,
       dog = "It's a dog!",
       elephant = "It's an elephant!", 
       cat = "Meow!", 
       tiger = "A tiger? In Africa?")

# - code blocks in switch
some_expression = 'hey'
switch(some_expression, 
       hey = { 
         print(2 + 2)
         print('Hey!') 
       },
       hi = { 
         print(5 + 5)
         print('Hi!')
       },
       {
         print(6 * 3)
         print('Default case!')
       }
)

# - vectorized ifelse
ifelse(10 < 5, 
       "I do not understand basic arithmetics.", 
       "Ok I got at least that one right."
)
trues <- sample(c(TRUE, FALSE), 100, replace = TRUE)
print(trues)
ifelse(trues,
       print("Yes"),
       print("No")
)

# - functionals















