###########################
# Author: Angnar
# Date: 2025/01/20
# Aim: Create Commanders [Pal]
###########################

# create a new pal with role `"angnar"` that replaces the selected text:
prompt_new(
  "angnar",
  interface = "prefix"
)

# Add or modify revealjs scss theming
# prompt_new(
#   "revealjstheming",
#   "replace",
#   "https://gist.githubusercontent.com/EmilHvitfeldt/c2a3f8f294aec242144a9e135db2e2a3/raw/79298f9f5178a558e2c3422d745e7393fd483396/revealjs-scss-theming-prompt.md"
# )

# Transition to Quarto-style chunk headers
# prompt_new(
#   "quartochunk",
#   "replace",
#   "https://gist.githubusercontent.com/hfrick/1ca8fc2cb2a4409b743e8120c6cc2223/raw/a9703edfbd4e83839af0278c33add1b33e243d02/quartochunk-replace.md"
# )

# A ggplot2 assistant
# pak::pak("frankiethull/ggpal2")
# library(ggpal2)

# After writing a prompt, register it with the pal package with:
directory_load()

# After closing the file, reopen with:
prompt_edit("angnar")

# Remove the prompt (next time the package is loaded) with:
prompt_remove("angnar")
