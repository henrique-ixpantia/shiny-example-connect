# Shiny + box + renv: Posit Connect Deployment Example

This repository provides a minimal, yet complete, example of a modular Shiny application built with the `{box}` and `{renv}` packages. Its primary purpose is to serve as a straightforward example for guides on deploying to Posit Connect from a Git repository.

##  ключевые_особенности (Key Features)

-   **Modular Architecture**: Code is organized into modules using `{box}`.
-   **Reproducible Environment**: Dependencies are managed by `{renv}`.
-   **Modern UI**: The interface is built with `{bslib}` and styled with SASS.
-   **Connect-Ready**: Includes the necessary `app.R` entrypoint for seamless deployment.

## 🚀 Deployment to Posit Connect

Deploying this application from GitHub to Posit Connect is simple.

1.  **Push to GitHub**: Make sure your code is pushed to a GitHub repository.
2.  **In Posit Connect**:
    *   Click **"Publish"** -> **"Import from Git"**.
    *   Enter the URL of your GitHub repository.
    *   Click **"Next"**.
3.  **Configuration**:
    *   Connect will automatically detect this is a Shiny Application because of the `app.R` file in the root.
    *   It will also detect the `renv.lock` file and use `{renv}` to restore the exact package versions.
    *   Give your application a name and click **"Publish"**.

That's it! Connect will clone the repository, restore the R environment, and deploy the application.

## Directory Structure

```text
.
├── app.R              # Entrypoint for Posit Connect
├── renv.lock          # R package versions
├── .Rprofile          # Configures renv and box
├── r/                 # Main source code for box modules
│   ├── main.R         # Main app UI and Server logic
│   ├── utils.R        # Shared utilities (e.g., theme)
│   ├── components/
│   │   ├── header.R   # Header UI module
│   │   └── sidebar.R  # Sidebar with filters module
│   └── modules/
│       └── plot_module.R # Main plot content module
├── data/
│   ├── data_loader.R  # Box module to load data
│   └── sample_data.csv# Sample data for the app
└── styles/
    ├── main.scss      # Custom SASS styles
    └── _variables.scss# SASS variables