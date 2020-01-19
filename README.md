# heroku_test

* 'Manual' test cases can be found in the feature file that uses the Gherkin language(../features/heroku_app.feature). 
* Automation framework was written in Ruby using Capybara and RSpec 

The test approach to this automated regression pack is pretty straightforward in the sense that the manual test cases are documented using Gherkin (which has a clear structure that showcases the test steps and expected outcomes). The test cases were tested manually before being automated; there is a selection of postive and negative tests that try to cover the most common user stories. 

Using BDD allows for non-programmers to run the tests without needing to know any of the code and enables the documentation to come hand in hand with the automation. This also enables for more colloboration between BAs, developers and testers. 

Most of the actual Ruby code can be found under ../features/modules/Computers - the aim of this is to make the steps definition file as free from complexity as possible and allow maintenance/reworking of the framework to be relatively painless. 

RubyMine Runner Options: --color -r features -p firefox


