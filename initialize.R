# Load the required packages
library(jsonlite)

# Store the base URL of the API
base_url <- 'http://services.runescape.com/m=itemdb_oldschool'

# Download the json of item names and IDs and store it in a dataframe
### (Think about loading directly these info from the API)
item_ids_url <- 'https://pastebin.com/raw/LhxJ7GRG'
item_ids <- fromJSON(item_ids_url)

# Store the URL to add to the base to get info on items
item_info_url = '/api/catalogue/detail.json?item='  # + itemID

# Store the URL to get historic values of item
item_price_url = '/api/graph/'  # + itemID + .json