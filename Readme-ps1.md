# PS1: Linear Feedback Shift Register (part A)

## Contact

Name: Jason Ossai

Section: COMP 2040 P 1 201

Time to Recomplete: November 7th, 2024

## Representation Explanation

In my initial attempt at this assignment, I failed all the tests by auto grader. But after watching a YouTube video about `LFSR`, and going over all my unit tests on gradescope submission I understood what my problem was, including lots of misplaced member functions.


### CHANGES (November 7th, 2024)

I had to put the main function in the main.cpp not in the photo magic,In main.cpp, it usually indicates that the main function is configured as a simple beginning program or placeholder. There is currently no specific functionality added to main.cpp. I also had to fix all my unit tests so it runs with the auto grader. I also have to make sure I was giving the right classes to each member functions in my code. I did this by also properly simulating the step function, and by reading more about boost unit testing.

## Unit Tests

A discussion of what's being tested in your two additional Boost unit tests.

> According to **_What to turn in_
** I wrote 4 tests all together (including 2 additional tests)

### 1

The purpose of the first unit test is to assess how well the override "<<" operator functions. Once overridden, this operator is in charge of sending a readable binary string representation of the Linear Feedback Shift Register (LFSR) to the designated ostream.

In the event that the LFSR object remains unchanged, the output string ought to match the seed string.

~~~c++
const std::string initialLFSR = "0110110001101100";
const FibLFSR l(initialLFSR);
std::stringstream ss;
ss << l;
BOOST_REQUIRE_EQUAL(ss.str(), initialLFSR);
~~~

### 2

The second unit test assesses the overridden "<<" operator in more detail. This test uses the operator to produce an output string following nine LFSR rounds. By hand calculation, the predicted state of the LFSR for comparison is established.


~~~c++
const std::string initialLFSR = "0110110001101100";
const std::string expectedLFSRAfterGenerate = "1101100001100110";
FibLFSR l(initialLFSR);
l.generate(9);

std::stringstream ss;
ss << l;
BOOST_REQUIRE_EQUAL(ss.str(), expectedLFSRAfterGenerate);
~~~



