#' @importFrom methods as
#' @importFrom stats quantile
NULL

# Convert data to transactions
load_transactions <- function(data) {
  as(data, "transactions")
}

# Get item frequencies
item_frequency <- function(transactions) {
  arules::itemFrequency(transactions)
}

# Generate association rules
generate_rules <- function(transactions, support = 0.1, confidence = 0.5) {
  arules::apriori(transactions,
                  parameter = list(supp = support, conf = confidence))
}
