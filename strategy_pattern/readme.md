# Notes

- If instead of creating subclasses for each variation, we tear out the whole annoyingly varying chunk of code and isolate it in its own class?, Then we could create a whole family of classes, one foreach variation

- The key idea underlying the `Strategy Pattern` is to define a family of objects, the **strategies**, which all do the same thing .

- In our first example, both of the strategy objects support `output_report` method, given that all of the strategy objects look alike from the outside, the user of the strategy - called the **context** class - can treat the strategies like interchangeable parts

![enter image description here](https://i.imgur.com/Tfqw37W.png)
