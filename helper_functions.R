
# a function to read in google sheets
read_subsheet <- function(subsh){
  
  googlesheets4::gs4_deauth()
  sh <- Sys.getenv("RESUMECV_URL")
  googlesheets4::read_sheet(sh, sheet = subsh)
  
}

parse_csl_entry <- function(entry, max_len = 6, min_length = 4){
  # these entries come out in a funny format; parse them into a single character vector
  
  entry %>%
    mutate(first_initial = str_c(str_sub(first_name, 1,1), ".")) %>%
    mutate(to_return = glue("{last_name}, {first_initial} {middle_name}", .na = "")) %>%
    pull(to_return) %>%
    str_trim() -> full_list
  
  # a bit of logic to shorten long entries
  if(length(full_list) >= max_len){
    index <- str_which(full_list, "Tapera")
    if(index < min_length){
      full_list <- c(full_list[1:min_length], "...", full_list[length(full_list)])
    } else{
      full_list <- c(full_list[1:index], "...", full_list[length(full_list)])
    }
  }
  str_flatten(full_list, collapse = ", ")
  
}