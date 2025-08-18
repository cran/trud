## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = Sys.getenv("IN_PKGDOWN") == "true" & Sys.getenv("TRUD_API_KEY") != ""
)

## ----setup--------------------------------------------------------------------
# library(trud)

## ----get-subscribed-metadata--------------------------------------------------
# get_subscribed_metadata()

## ----trud-items---------------------------------------------------------------
# trud_items()

## ----get-item-metadata--------------------------------------------------------
# get_item_metadata(394) |>
#   # Display structure without showing sensitive API keys in URLs
#   purrr::map_at("releases", \(release) purrr::map(release, names))

## ----download-item------------------------------------------------------------
# # by default the latest release will be downloaded to the current working directory
# x <- download_item(394, directory = tempdir())
# unzip(x, list = TRUE)

## ----specific-releases--------------------------------------------------------
# # Get metadata for all releases (not just latest)
# metadata <- get_item_metadata(394, release_scope = "all")
# 
# # Release IDs are in the `id` field of each release
# metadata$releases |> purrr::map("id")
# 
# # The same IDs are also used to name the releases list
# metadata$releases |> names()
# 
# # Use a specific release ID with download_item()
# release_id <- metadata$releases[[1]]$id  # Get ID of first release
# download_item(394, directory = tempdir(), file_type = "checksum", release = release_id)

