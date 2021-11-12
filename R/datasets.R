#' List of episodes
#'
#' List of all episodes from the revived Doctor Who era (2005-present)
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{era}}{"classic" or "revived"}
#'   \item{\code{season_number}}{Season number}
#'   \item{\code{serial_title}}{Serial title if available}
#'   \item{\code{story_number}}{Story number}
#'   \item{\code{episode_number}}{Episode number in season}
#'   \item{\code{episode_title}}{Episode Title}
#'   \item{\code{type}}{"episode" or "special"}
#'   \item{\code{first_aired}}{Date the episode first aired in the U.K.}
#'   \item{\code{production_code}}{Episode's production code if available}
#'   \item{\code{uk_viewers}}{Number of U.K. viewers (millions)}
#'   \item{\code{rating}}{Episode's rating}
#'   \item{\code{duration}}{Episode's duration in minutes}
#' }
#'
#' @import dplyr
#'
#' @source \url{https://en.wikipedia.org/wiki/List_of_Doctor_Who_episodes_(2005-present)}
#'
#' @examples
#' library(dplyr)
#' episodes %>%
#'     filter(type == "special")
"episodes"

#' List of directors
#'
#' List of directors for all episodes from the revived Doctor Who era (2005-present)
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{story_number}}{Story number}
#'   \item{\code{director}}{Episode's director}
#' }
#'
#' @import dplyr
#'
#' @source \url{https://en.wikipedia.org/wiki/List_of_Doctor_Who_episodes_(2005-present)}
#'
#' @examples
#' library(dplyr)
#' directors %>%
#'     count(director) %>%
#'     arrange(desc(n)) %>%
#'     head(5)
"directors"

#' List of writers
#'
#' List of writers for all episodes from the revived Doctor Who era (2005-present)
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{story_number}}{Story number}
#'   \item{\code{writer}}{Episode's writer}
#' }
#'
#' @import dplyr
#'
#' @source \url{https://en.wikipedia.org/wiki/List_of_Doctor_Who_episodes_(2005-present)}
#'
#' @examples
#' library(dplyr)
#' directors %>%
#'     count(writer) %>%
#'     arrange(desc(n)) %>%
#'     head(5)
"writers"
