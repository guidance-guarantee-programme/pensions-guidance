Feature: Calculators
  As a visitor to the website considering the 6 options
  I want to input my own numbers
  So that I can find out what the options mean to me

  Scenario Outline: Load a guide
    When I visit the <Slug> guide
    Then the calculator is displayed

    Examples:
      | Slug                |
      | leave-pot-untouched |
      | take-cash-in-chunks |
      | take-whole-pot      |

  @javascript
  Scenario: Estimate how much pot could be worth in the future if left untouched
    Given I am on the leaving your whole pension pot untouched guide
    When I input the total value of my pension pot and how much I could contribute each year
    Then I should see how much my pot could be worth for each of the next 5 years
    And it explains the values are estimates based on growth at 3% per year
    And it explains the values will be affected by inflation and how much my provider charges for managing the pot

  @javascript
  Scenario: Estimate how much tax after taking first chunk
    Given I am on the take cash in chunks guide
    When I input the total value of my pension pot, my income for the year and how much cash I want to take upfront
    Then I should see how much tax I might pay
    And I should see how cash I would get
    And I should see how the remaining value of my pot