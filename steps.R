# Steps to deploy Shiny App on GitHub Pages

# 00. GitHub repo has already been created and cloned.

# 01. Create an app: Copy "Hello World" from `{shiny}`

system.file("examples", "01_hello", package="shiny") |>
  fs::dir_copy("app", overwrite = TRUE)

# 02. Export to Shinylive app

# Load the shinylive package
library(shinylive)

# Export the app
shinylive::export("app", "site")  # This can take a few minutes

# 03. Check the app is working 

httpuv::runStaticServer("site")
 
# 04. Add Yaml
library(usethis)
usethis::use_github_action(url="https://github.com/posit-dev/r-shinylive/blob/actions-v1/examples/deploy-app.yaml")
