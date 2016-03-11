Feature: Richdeps/Behave test
 TestA `Requires: TestC if (TestB or TestD)`

Scenario:
  Given I use the repository "rich-4"
  When I execute "bash" command "rpm -Uvh  /repo/TestD*.rpm" with "success"
  Then transaction changes are as follows
   | State        | Packages   |
   | installed    | TestD      |
  When I execute "dnf" command "-y install TestA" with "success"
  Then transaction changes are as follows
   | State        | Packages      |
   | installed    | TestA, TestC  |
