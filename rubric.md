# Code Quality Rubric
We will be evaluating the code quality based on the below criteria:

* Good naming that reflects the semantic meaning
* No dead code that confuses people 
* Consistent coding style
* Cyclomatic complexity is not high - not too much nested logic
* Good use of commenting - relies mostly on understandable code but documents tricky parts
* If there are shortcomings, they are highlighted in the ReadMe file

* Refrains from using global mutable state
* Single source of truth - When you need to change something, you can change it in one place most of the time and it is sufficient
* Good selection of 3rd party dependencies - choices of 3rd party dependencies are well maintained, well tested and free of bloat
* There is a good layered architecture and responsibilities are not leaked across layers
* Things that are simple are kept simple, complex ones make common sense and easy to follow
* Advanced techniques are used only where it made sense
* Immutable data structures are preferred 
* Evidence of good understanding of side effects and they are pushed to the boundaries, leaving majority of the code easy to test with unit tests

* The code is refactored so that you can write isolated unit tests - classes & methods are not trying to do too many things
* The tests assert one thing (to the extent possible) at a time
* Test code quality is also high - maintainability is taken into account
* Dependencies are minimized, so there is as little mocking required as possible
