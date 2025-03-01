# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

# React and related libraries
pin "react" # @19.0.0
pin "react-dom" # @19.0.0
pin "react/jsx-runtime", to: "react--jsx-runtime.js" # @19.0.0
pin "scheduler" # @0.25.0

# Application specific JavaScript
pin_all_from "app/javascript/components", under: "components"
pin "react_app", to: "react_app.js"
pin "react-dom/client", to: "react-dom--client.js" # @19.0.0
pin "process" # @2.1.0
