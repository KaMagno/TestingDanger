message("Danger working here")

# Warn when there is a big PR
warn('Big PR') if git.lines_of_code > 500

modified_files = git.modified_files + git.added_files

# Sometimes its a README fix, or something like that - which isn't relevant for
# including in a CHANGELOG for example
has_app_changes = !modified_files.grep(/Source/).empty?
has_test_changes = !modified_files.grep(/Tests/).empty?
has_danger_changes = !modified_files.grep(/Dangerfile|script\/oss-check|Gemfile/).empty?
has_rules_changes = !modified_files.grep(/Source\/SwiftLintFramework\/Rules/).empty?
has_rules_docs_changes = modified_files.include?('Rules.md')

return unless has_app_changes || has_danger_changes

# Non-trivial amounts of app changes without tests
if git.lines_of_code > 50 && has_app_changes && !has_test_changes
  warn 'This PR may need tests.'
end
