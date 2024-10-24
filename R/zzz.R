.onLoad <- function(libname, pkgname) {

  ## tgstat token
  if ( Sys.getenv("TG_API_TOKEN") != "" ) {

    tg_api_token <- Sys.getenv("TG_API_TOKEN")
    cli_alert_info('Set API TOKEN from System Environ {.envvar TG_API_TOKEN}')

  } else {

    tg_api_token <- NULL

  }

  ## default channel
  if ( Sys.getenv("TG_CHANNEL_ID") != "" ) {

    tg_channel_id <- Sys.getenv("TG_CHANNEL_ID")
    cli_alert_info('Set CHANNEL ID from System Environ {.envvar TG_CHANNEL_ID}: {.field {tg_channel_id}}')

  } else {

    tg_channel_id <- NULL

  }

  # options
  op <- options()
  op.tg <- list(tg.api_token  = tg_api_token,
                tg.base_url   = 'https://api.tgstat.ru/',
                tg.channel_id = tg_channel_id,
                tg.max_tries  = 2,
                tg.interval   = NULL,
                tg.check_api_quote = TRUE,
                tg.api_quote_alert_rate = 0.9)

  toset <- !(names(op.tg) %in% names(op))
  if (any(toset)) options(op.tg[toset])

  invisible()
}

.onAttach <- function(lib, pkg,...){

  packageStartupMessage(rtgstatWelcomeMessage())

}


rtgstatWelcomeMessage <- function(){

  paste0("\n",
         "---------------------\n",
         "Welcome to rtgstat version ", utils::packageDescription("rtgstat")$Version, "\n",
         "\n",
         "Author:           Alexey Seleznev (Head of analytics dept at Netpeak).\n",
         "Telegram channel: https://t.me/R4marketing \n",
         "YouTube channel:  https://www.youtube.com/R4marketing/?sub_confirmation=1 \n",
         "Email:            selesnow@gmail.com\n",
         "Site:             https://selesnow.github.io \n",
         "Blog:             https://alexeyseleznev.wordpress.com \n",
         "Facebook:         https://facebook.com/selesnown \n",
         "Linkedin:         https://www.linkedin.com/in/selesnow \n",
         "\n",
         "Type ?rtgstat for the main documentation.\n",
         "The github page is: https://github.com/selesnow/rtgstat/\n",
         "Package site: https://selesnow.github.io/rtgstat/\n",
         "\n",
         "Suggestions and bug-reports can be submitted at: https://github.com/selesnow/rtgstat/issues\n",
         "Or contact: <selesnow@gmail.com>\n",
         "\n",
         "\tTo suppress this message use:  ", "suppressPackageStartupMessages(library(rtgstat))\n",
         "---------------------\n"
  )
}
