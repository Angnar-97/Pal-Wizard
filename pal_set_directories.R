###########################
# Author: Angnar
# Date: 2025/01/20
# Aim: Example [Pal]
###########################

# Load the package
library(pal)

# Check the default prompt directory path
default_dir <- directory_path()
# Print out the current prompt directory
print(paste("Default prompt directory:", default_dir))

# Set a custom prompt directory
# For example, using a folder named "commanders" in the current working directory
custom_dir <- file.path(
  getwd(),
  "commanders"
)

directory_set(custom_dir)

print(paste("Custom prompt directory set to:", custom_dir))

# Ensure the custom directory exists and contains markdown files
if (!dir.exists(custom_dir)) {
  dir.create(custom_dir, recursive = TRUE)
  # Create example markdown files
  writeLines(
    c(
      "# Proofread Prompt", 
      "Replace the selected text with a proofread version."
    ),
    file.path(custom_dir, "proofread-replace.md")
  )
  writeLines(
    c(
      "# Summarize Prompt",
      "Prefix the selected text with a summarized version."
    ),
    file.path(
      custom_dir,
      "summarize-prefix.md"
    )
  )
  
  print("Example markdown files created in the custom directory.")
  
}

# Load prompts from the custom directory
directory_load()
print("Prompts registered from the custom directory.")

# List all available prompts
prompts <- directory_list()
print("Available prompts:")
print(prompts)

# Verify the updated prompt directory
updated_dir <- directory_path()
print(paste("Updated prompt directory:", updated_dir))
