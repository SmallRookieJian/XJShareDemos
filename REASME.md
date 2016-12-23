###尝试用UITableView的创建模式生成新视图

#####我也有一个小小的想法

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一直都有个想法：想着去尝试一下苹果API中的一些代码的写法或者说是实现方法，比如：（这个想法最早）给按钮添加一个点击方法（有过尝试，但还是没有实现，如果，看到的你知道点什么的话， 劳烦点拨一下，先行告谢），（然后就是我今天要说的这个）用UITableView的datasource和delegate的这种方式来实现视图内容的布置。

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开发中总是会自定义很多的视图，某些视图其实可以分成很多个小的部件，我在这里称这为*基础视图*，比如：一个有多个标题的导航菜单，其实可以看作是由很多个只展示菜单信息的*基础视图*组成，并且这些基础视图往往是相类似的。

#####我之前的做法

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;先前是用最平常的方法创建视图，然后给这个视图开放一个公有属性（一般是NSArray类型的），然后实现这个公有属性的set方法，在这个set方法中来完成这些基础视图的创建。这个方法百试不爽。天空飘来五个字，爽爽爽爽爽！

#####那么问题来了

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;但偶然的一天，产品经理（这个让技术进步功不可没人）冒出来，说：你来给我做做这个。然后问题就来了。。。我现在的菜单不仅仅要文字，再给我来一组图片吧！按照之前的方法，我应该再来一个属性，再来一遍set方法，由于要使用Masonry来定位置，并且标题和文字的位置有关系，所以两个set方法中都得根据这两个属性来创建一遍视图，这样会平白无故多创建很多视图。所以不爽！！
无意间想尝试尝试tableView中的datasource那种方法（不时来一次新的尝试让自己爽爽）。

#####牛刀小试



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;其实，声名代理这些都没什么，再尝试的时候被卡了一下的是，我这些代理要在那里用呢？找了半天找了一个方法，大家都用它！

>	**\- (void)willMoveToSuperview:(UIView *)newSuperview; **

>	Instance Method

>	willMoveToSuperview:

>	Tells the view that its superview is about to change to the specified superview.

方法大意：**当本视图的父视图改变时会主动调用，包括从无到有**。

#####意外收获

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这里还想到UIViewController的 __viewWillAppear__ 和 __viewDidAppear__这一类方法的调用方式，我可以在willMoveToSuperview方法才开始的时候（也就是各种视图都还没有创建的时候）调用viewWillAppear，然后在willMoveToSuperview方法结束时（也就是各种视图都已经创建结束后）调用 viewDidAppear。

#####尾语

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用这种方法才实现这种功能时，真的是莫名的兴奋，想着要分享分享，但这怎么越写越虚？？其实并没有什么内容！

######大家加油，自己加油！保持写东西分享！

######为了尝试技术而做东西的人！


[代码在这里哟]: <https://github.com/SmallRookieJian/XJShareDemos ()> 
