### Rails UI Components

Using Bootstrap 4.0.0 Alpha, Rails UI Components wraps various HTML-based UI components to allow a declarative UI that is testable.

Wrapping Bootstrap Elements in UI Components for use in Rails Apps.

Components are testable, predictable, and isolated. Using UI Components means that your UI is tested rather than relying on falliable and error prone HTML/ERB writing.

*Demo* : (https://rails-ui.herokuapp.com/)[https://rails-ui.herokuapp.com/]


Development
---
1. All base HTML elements are defined in `ui_component_helper.rb`, currently under `app/controllers/concerns`
2. All Bootstrap elements are defined in `app/controllers/conerns/bootstrap/config/*.yml`
3. Methods are dynamically created from the YAML (will explain this later).
4. All tests are under `test/helpers/*_test.rb` and test every method and intended usage.
