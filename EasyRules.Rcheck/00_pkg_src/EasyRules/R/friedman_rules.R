#' @importFrom methods as
#' @importFrom stats quantile
NULL

#' Load transaction data
#' Converts a dataset into transactions format.
#' @param data A dataset to be converted.
#' @return A transactions object.
#' @export
load_transactions <- function(data) {
  as(data, "transactions")
}

#' Get item frequencies
#' Calculates the frequency of items in transactions.
#' @param transactions A transactions object.
#' @return A numeric vector of item frequencies.
#' @export
item_frequency <- function(transactions) {
  arules::itemFrequency(transactions)
}

#' Generate association rules
#' Creates association rules using the apriori algorithm.
#' @param transactions A transactions object.
#' @param support Minimum support value.
#' @param confidence Minimum confidence value.
#' @return A set of association rules.
#' @export
generate_rules <- function(transactions, support = 0.1, confidence = 0.5) {
  arules::apriori(transactions,
                  parameter = list(supp = support, conf = confidence))
}
