#' List of Dr Who episodes
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
#' @import magrittr
#'
#' @source \url{https://en.wikipedia.org/wiki/List_of_Doctor_Who_episodes_(2005-present)}
#'
#' @examples
#' library(dplyr)
#' drwho_episodes %>%
#'     filter(type == "special")
"drwho_episodes"

#' List of Dr Who directors
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
#' drwho_directors %>%
#'     count(director) %>%
#'     arrange(desc(n)) %>%
#'     head(5)
"drwho_directors"

#' List of Dr Who writers
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
#' drwho_writers %>%
#'     count(writer) %>%
#'     arrange(desc(n)) %>%
#'     head(5)
"drwho_writers"

#' List of Torchwood episodes
#'
#' List of all episodes from the Torchwood series (2006-2011)
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{season_number}}{Season number}
#'   \item{\code{serial_title}}{Serial title if available}
#'   \item{\code{story_number}}{Story number}
#'   \item{\code{episode_number}}{Episode number in season}
#'   \item{\code{episode_title}}{Episode Title}
#'   \item{\code{first_aired}}{Date the episode first aired in the U.K.}
#'   \item{\code{production_code}}{Episode's production code if available}
#'   \item{\code{uk_viewers}}{Number of U.K. viewers (millions)}
#'   \item{\code{duration}}{Episode's duration in minutes}
#' }
#'
#' @import dplyr
#' @import magrittr
#'
#' @source \url{https://en.wikipedia.org/wiki/List_of_Torchwood_episodes}
#'
#' @examples
#' library(dplyr)
#' torchwood_episodes %>%
#'     filter(uk_viewers >= 5)
"torchwood_episodes"

#' List of Torchwood directors
#'
#' List of directors for all episodes from Torchwood series (2006-2011)
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{story_number}}{Story number}
#'   \item{\code{director}}{Episode's director}
#' }
#'
#' @import dplyr
#'
#' @source \url{https://en.wikipedia.org/wiki/List_of_Torchwood_episodes}
#'
#' @examples
#' library(dplyr)
#' torchwood_directors %>%
#'     count(director) %>%
#'     arrange(desc(n)) %>%
#'     head(5)
"torchwood_directors"

#' List of Torchwood writers
#'
#' List of directors for all episodes from Torchwood series (2006-2011)
#'
#' @format This data frame contains the following columns:
#' \describe{
#'   \item{\code{story_number}}{Story number}
#'   \item{\code{writer}}{Episode's writer}
#' }
#'
#' @import dplyr
#'
#' @source \url{https://en.wikipedia.org/wiki/List_of_Torchwood_episodes}
#'
#' @examples
#' library(dplyr)
#' torchwood_writers %>%
#'     count(writer) %>%
#'     arrange(desc(n)) %>%
#'     head(5)
"torchwood_writers"
