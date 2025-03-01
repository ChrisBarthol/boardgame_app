# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "react" # @19.0.0
pin "react-dom" # @19.0.0
pin "react/jsx-runtime", to: "react--jsx-runtime.js" # @19.0.0
pin "buffer" # @2.1.0
pin "buffer-from" # @1.1.2
pin "crypto" # @2.1.0
pin "fs" # @2.1.0
pin "inspector" # @2.1.0
pin "os" # @2.1.0
pin "path" # @2.1.0
pin "perf_hooks" # @2.1.0
pin "process" # @2.1.0
pin "source-map" # @0.6.1
pin "source-map-support" # @0.5.21

# TypeScript support
pin "typescript" # @5.7.3
pin "@babel/standalone", to: "@babel--standalone.js" # @7.26.9
pin "ts_loader", to: "ts_loader.js"

# Application specific JavaScript
pin_all_from "app/javascript/components", under: "components"
pin "react_app", to: "react_app.js"