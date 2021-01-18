# Doing a code review

Do multiple "passes" where focus is on one attribute at at time. Start at the
beginning and review the pull request with a single attribute in mind before
moving on to the next.


## Attributes

  - Consistency across the codebase

  - Architectural considerations - how does the new piece of code fit the 
    existing architecture. Can the new feature architecture be improved, 
    is it too generic or not extensible enough?

  - KISS

  - Performance concerns - are there specific cases (eg. peak load times) 
    when the code will break? Do the queries pull more data than necessary? 
    Could new queries benefit from adding new indexes to the database?

  - Accidental errors such as typos or errors in math formulas

  - Compliance with laws and regulations - depending on the business this 
    might be the most important thing

  - Security concerns - are there any exploitable pieces of code being 
    introduced? Are any secrets being shared or stored unsafely?

  - Readability and style

  - Localization - are all language dependent resources localized properly?

  - Dependencies - are there external libraries or APIs being introduced? 
    Are there other simpler/faster/better ways to do this with different 
    dependencies or without any?

  - Interactions and side effects - how does the new piece of code interact 
    with the rest of the codebase; does the new function implementation break 
    any existing functionality; are all relevant unit tests updated/added

  - Logging - it's practically impossible to debug server code properly without 
    good logging. Is everything logged/traced correctly

  - Error handling - how are the errors handled on the backend; how are they 
    communicated to the user; are fallbacks activated where possible?

  - Testability/Test coverage - is the new piece of code covered with automated 
    tests? Have all the suspicious test cases been checked either automatically 
    or manually? Is the code written in a way that's suitable for unit testing?

  - External documentation - in case it's necessary is the external 
    documentation updated to reflect the change?




