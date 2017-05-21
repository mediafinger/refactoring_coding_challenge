# A refactoring exercise.

The `transfers.csv` file contains information about a number of fictional money transfers. The three fields are:

1. Sending account
2. Receiving account
3. Amount being transferred

The `analyse_transfers.rb` file contains some code to analyse this data.  
For each unique pair of sending and receiving accounts, it computes the number of transfers performed, as well as the min, max and mean amount.

It outputs this information as an HTML table, showing the most used transfers first.

You can run the code like this:

    $ ruby analyse_transfers.rb > output.html

You can then open the `output.html` file in your browser to see the results.

## Your task

Your task is to refactor the code to make it more maintainable and easier to change.

There are no tests. If you want to add some, please feel free.

We expect you to spend around 60-90 minutes on this tasks. However, we're not strict about this and if you go a bit over because you want to get something finished then that's fine. But we don't want to be unreasonable - so you are not expected to stay up all night coding away!

As you work on your solutions, you should make commits to the repository along the way, just as you would on a 'real' project. This is so we can see the progression of how you came to the solutions you did.

Please add a few lines to the `YOUR_NOTES.markdown` file if you see fit.

## Hints

* Think about separation of concerns
* Please don't spend time making the HTML output pretty; that's not what we're testing here
* Feel free to use external libraries if they are useful
* As the time for this task should be limited, we don't expect a perfect solution

Have fun, and feel free to ask questions if anything is unclear.
