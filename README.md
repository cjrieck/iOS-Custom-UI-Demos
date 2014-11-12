iOS-Custom-UI-Demos [![Build Status](https://travis-ci.org/cjrieck/iOS-Custom-UI-Demos.svg?branch=master)](https://travis-ci.org/cjrieck/iOS-Custom-UI-Demos)
===================

App containing a collection of demo UIs

Please feel free to fork and add your own custom UI elements!

How to Contribute
===================

(I will be automating this process soon, so stay tuned!)
- Create a Group in the Demo group and name it the name of your UI demo
- Treat this Group as your 'Application' group. Add all of your classes in here.
- In the `CURootMainMenuViewController.m` add your Group's name to the `_demoTitles` array in the `init` method.
- In `- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath` create a new `case` with the index of your group's title.
- Set `demoViewController = [[YourDemosBaseViewController alloc] init]`
- Test