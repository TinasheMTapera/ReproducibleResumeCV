FROM rocker/r-ver:4.1.0
LABEL maintainer="ttapera"
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
  && apt-get install -y git-core
RUN ["install2.r", "dplyr", "forcats", "ggplot2", "glue", "googlesheets4", "here", "purrr", "readr", "remotes", "shiny", "stringr", "tibble", "tidyr", "tidyverse", "todor"]
RUN ["installGithub.r", "ropensci/rcrossref@319f34c8e8cbb41c2cb06282e612b870f61b85cd"]
WORKDIR /payload/
CMD ["R"]
