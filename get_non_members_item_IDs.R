# Load the basic URLs and Item-ID dataframe to work with
source('prices_scrapper.R')

# Make a list of all of the item IDs
id_list <- item_ids$id

# Remove from this list the faulty IDs
faulty_ids <- c(4212, 4224, 8534, 8536, 8538, 8540, 8542, 8544, 8546,
                8630, 8632, 8634, 8636, 8638, 8640, 8642, 8644, 8646, 8648)

id_list <- id_list[!id_list %in% faulty_ids]

# Create two vectors with members and non members IDs
non_members_ids <- c()
members_ids <- c()
i <- 0

# Due to the limit of calls on the API, I added a sleep timer of two minutes
# every 100 items IDs 
for (id in id_list[2583:3011]) {
  if (fromJSON(paste(base_url, item_info_url, id, sep = ''))$item$members) members_ids <- c(members_ids, id)
  else non_members_ids <- c(non_members_ids, id)
  i <- i + 1
  if (i %% 100 == 0) Sys.sleep(120)
}

# Save the list of members and non-members items in csv
write.csv(non_members_ids, file='non_members_ids.csv', row.names = FALSE)
write.csv(members_ids, file='members_ids.csv', row.names = FALSE)