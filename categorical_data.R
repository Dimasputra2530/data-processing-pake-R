# Data Preprocessing

# Importing the dataset
dataset = read.csv('Data.csv')

# Taking care of missing data
dataset$Age = ifelse(is.na(dataset$Age), #untuk menunjuk table mana yg mau di ambil pake $
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)), # parameter yang digunakan dalam berbagai fungsi untuk menentukan apakah nilai NA  harus diabaikan atau tidak 
                     dataset$Age) #ave untuk menghitung rata2

dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset$Salary)

# Encoding categorical data
dataset$Country = factor(dataset$Country, #factor untk mengkonfersi data kategorikal menjadi angka
                         levels = c('France', 'Spain', 'Germany'), #ketik f1 untuk liat info factor
                         labels = c(1, 2, 3)) #untuk menyimpan kategori unik dari suatu variabel bertipe faktor
dataset$Purchased = factor(dataset$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))
