# Notes

- The general idea of the `Template Method Pattern` is to build an abstract base class with a skeletal method. This Skeletal method (also called a **template method**) drives the bit of processing that needs to be vary, but it does so by making calls to abstract methods, which are then supplied by the concrete subclasses

![enter image description here](https://i.imgur.com/Gp97bJa.png)

- In the `Template Method Pattern`, the abstract base class controls the higher-level processing through he template method; the subclasses simply fill the details

- Non-abstract methods that can be overridden in the concrete classes of the template method pattern are called **hook methods**

- `Hook methods` permit the concrete class to choose (1)to override the base implementation and do something different or (2)to simply accept the default implementation

- When the `Report` class calls `output_start`, for example, it is telling its subclasses; _"We're ready to start outputting the report, so if you need to do something, do it now"_

- They exist merely to let the subclasses know what is happening but not require the subclasses to override the methods that not interest them

- The `Template Method Pattern` is simply a fancy way of saying that if you want to vary an algorithm, one way is to code the invariant part in a base class and to encapsulate the variable parts in methods that are defined by a number of subclasses
