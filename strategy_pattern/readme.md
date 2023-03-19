# Notes

- If instead of creating subclasses for each variation, we tear out the whole annoyingly varying chunk of code and isolate it in its own class?, Then we could create a whole family of classes, one foreach variation

- The key idea underlying the `Strategy Pattern` is to define a family of objects, the **strategies**, which all do the same thing .

- In our first example, both of the strategy objects support `output_report` method, given that all of the strategy objects look alike from the outside, the user of the strategy - called the **context** class - can treat the strategies like interchangeable parts

![enter image description here](https://i.imgur.com/Tfqw37W.png)

- One of our formatting strategies produces HTML while the other produces Plain Text

- If we were doing tax calculations, we might have use the `Strategy Pattern` for state income tax calculations: one strategy to compute taxes for residents in Virginia, and another to do calculations according to the California tax code

- we can achieve better separation of concerns by pulling out a set of strategies from a class. By using the strategy pattern, we relieve the `Report` class of any responsibility for or knowledge of the report file format

- `Strategy Pattern` is based on composition and delegation, rather than on inheritance, it is easy to switch strategies at runtime. We simpley swamp out the strategy object

```
report = Report.new(HTMLFormatter.new)
report.output_report

report.formatter = PlainTextFormatter.new
report.output_report
```

- The `Strategy Pattern` does have one thing in common with the `Template Method Pattern` : both patterns allow us to concentrate the decision about which variation we are using in one or few places

- We can get data from the `context` to the strategy by having the context object pass a reference to itself to the strategy object.

- The `strategy object` can then call methods on the `context` to get at the data it needs

- Recasting our report formatting example to use a `Proc` Strategy is trivial. the only changes we need to make to the `Report` class are to add an ampersand to pick up any block that is passed to the `initialize` method and to rename the method that we call from `output_report` to `call`

- The `Strategy Pattern` is a delegation-based approach to solving the same problem as the `Template Method Pattern`. instead of teasing out variable parts of your algorithm and pushing them down into subclasses, you simply implement each version of your algorithm as a separate object

- Ruby code blocks, which are essentially code wrapped up in an instant object (the `Proc` object), are wonderfully useful for creating quick, albeit, simple, stragey objects
