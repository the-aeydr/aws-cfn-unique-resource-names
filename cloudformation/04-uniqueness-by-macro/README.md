# Uniqueness by Macro

This example is included as a simple demonstration of how it is possible to leverage [AWS CloudFormation template macros](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-macros.html) to call a lambda that is responsible for generating a random value using Python's built-in `random.randint`, returning the value for use within CloudFormation using `Fn::Transform`.

With this, it can be understood how it would be possible to create other "random generators" that are usable from within CloudFormation.

This example is excluded when discussion the uniqueness options as the article is focused on built-in functionality for uniqueness, and this approach has implications with maintaining a Macro for random string generation & `Fn::Transform`.
