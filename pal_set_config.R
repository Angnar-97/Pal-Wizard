###########################
# Author: Angnar
# Date: 2025/01/20
# Aim: Set Configuration [Pal]
###########################

# Link to Doc
# https://simonpcouch.github.io/pal/

# Set Key
# In RStudio, navigate to Tools > Modify Keyboard Shortcuts > Search "Pal" :: Ctrl+Alt+P

# Install the pal package if not already installed
if (!requireNamespace("pal", quietly = TRUE)) {
  install.packages("pal")
}

# Load the package
library(pal)

# Configure the LLM model
# Set the API key for Anthropic's Claude Sonnet 3.5 in .Renviron (done manually)
# Use usethis::edit_r_environ() to edit the .Renviron file, adding the line:
# ANTHROPIC_API_KEY=your.key.here
# Then restart your R session.
# https://www.anthropic.com/news/claude-3-5-sonnet
# Create a Key: https://console.anthropic.com/dashboard
usethis::edit_r_environ()


# Use a different model (optional)
# Use a model other than the default Claude Sonnet 3.5.

# Use OpenAI's API (e.g., GPT-4o-mini)
# options(
#   .pal_fn = "chat_openai",
#   .pal_args = list(model = "gpt-4o-mini")
# )

# Use a local model with Ollama
options(
  .pal_fn = "chat_ollama",
  .pal_args = list(model = "mistral")
)

# List available pals and their roles
available_roles <- directory_list()
print("Available pal roles:")
print(available_roles)

# Use a pal for a specific task
# Example: Use the "testthat" pal to transition R package unit tests to testthat's third edition
test_code <- "test_that('example', { expect_equal(1 + 1, 2) })"

# Simulate using the "testthat" pal
# In practice, this replaces the selected code with a converted version.
result <- pal("testthat", test_code)
print("Converted test code:")
print(result)

# Example: Use the "roxygen" pal to create roxygen templates for a function
roxygen_code <- "my_function <- function(x, y) { return(x + y) }"

# Simulate using the "roxygen" pal
# In practice, this prefixes the selected code with roxygen templates.
result <- pal("roxygen", roxygen_code)
print("Roxygen template:")
print(result)