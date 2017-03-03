@api @lightning @subprofile
Feature: Subprofiles

  Scenario: Sub-profile name should be listed and installed profile
    Given I am logged in as a user with the administrator role
    When I visit "/admin/reports/status"
    Then I should see "Lightning Extender"

  Scenario: Sub-profile modules should be enabled
    Given I am logged in as a user with the administrator role
    When I visit "/admin/reports/updates"
    Then I should see "Admin Toolbar"
    And I should see "Redirect"
