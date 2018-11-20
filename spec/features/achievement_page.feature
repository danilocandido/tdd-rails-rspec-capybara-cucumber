Feature: Achievement Page

  In order to read others aachievements
  As a gues user
  I want to see public Achievement

  Scenario: guest user sees public achievement
    Given I am a guest user
    And there is a public achievement
    When I go to the achievement's Page
    Then I must see achievement's content

