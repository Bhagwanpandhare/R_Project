# CRUD Operation on Train data

library("RMySQL")
connection <- dbConnect(MySQL(),
                 username="root",
                 password=" ",
                 port= 3306,
                 dbname="train")

dbListTables(connection)

dbListFields(connection,"train_data")

data1<- dbGetQuery(connection,"select * from train_data")
View(data1)

sq<- dbSendQuery(connection,"select * from train_data")
sq
data <- fetch(sq,n=2)
View(data)

# Create (INSERT) a new data in train_data
query <- "INSERT INTO train_data (TrainNo,Train_Name,Start_Station,End_Station) 
          VALUES (11071,'Kamayani Express', 'LTT',  'Banaras')"
dbSendQuery(connection , query)

# Read (SELECT) all Table
query1 <- "select * from train_data"
read <- dbGetQuery(connection, query1)
print(read)

# Update (UPDATE) a Train_Name
query2 <- "UPDATE train_data SET Train_Name = 'Koyna mail'  WHERE TrainNo = 11027"
dbSendQuery(connection, query2)

# Read (SELECT) the updated data
read <- "SELECT * FROM Train_data WHERE Train_Name = 'Mail'"
updated_data <- dbGetQuery(connection, read)
print(updated_data)

# Delete (DELETE) a data
del <- "DELETE FROM Train_data WHERE Train_Name = 'Kamayani Express'"
dbSendQuery(connection, del)

query <- "SELECT * FROM Train_data"
show <- dbGetQuery(connection, query)
print(show)

# Close the database connection
dbDisconnect(connection)
print("Connection close successfully")
