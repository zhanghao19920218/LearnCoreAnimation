# Core Animation 动画解析

## Introduction
* Layer Kit 上演变来的
* Core Animation是一个复合引擎, 尽可能快地组合屏幕上不同的可视内容
* 分解成独立的图层，存储在一个叫做图层树的体系之中

## 图层树
```
 从图层树开始，涉及一下Core Animation的静态组合以及布局特性
```
### 2.1 图层与视图
/Users/mason/Desktop/LearnCoreAnimation/42ef6760eece41e1886191094356ec3b_tplv-k3u1fbpfcp-watermark.jpeg

* 一个视图: 就是在屏幕上显示的一个矩形块（比如图片，文字或者视频）
* 所有视图都从一个叫做UIView的基类派生而来, UIView可以处理触摸事件，可以支持基于Core Graphics绘图，可以做放射变换（比如旋转或者缩放）

### 2.2 CALayer

* CALayer类在概念上和UIView类似同样也是一些被层级关系树管理的矩形 块，同样也可以包含一些内容（像图片，文本或者背景色），管理子图层的位置。 它们有一些方法和属性用来做动画和变换。
* __和UIView最大的不同是CALayer不处理用户的交互__
* CALayer并不清楚具体的响应链（iOS通过视图层级关系用来传送触摸事件的机制） ,于是它并不能够响应事件，即使它提供了一些方法来判断是否一个触点在图层的范围之内

### 2.3 平行的层级关系

```markdown
__每一个UIView都有一个CALayer实例的图层属性，也就是所谓的backing layer,视图的职责就是创建并管理这个图层，以确保当子视图在图层关系中添加或者被移除的时候，他们关联的图层也同样在图层关系树当中有相同操作__
```

* __实际上这些背后关联图层才是真正用在屏幕上显示和做动画__, UIView仅仅是对它的一个封装,提供了一些iOS类似于处理触摸的具体功能，以及Core Animation底层方法的高级接口

* 但是为什么iOS要基于 UIView 和 CALayer 提供两个平行的层级关系呢？为什 么不用一个简单的层级来处理所有事情呢？

  ```
  答：原因在于要做职责分离，这样也能避免很多重复代码。在iOS和Mac OS两个平台上，事件和用户交互有很多地方的不同， 基于多点触控的用户界面和基于鼠标键盘有着本质的区别，这就是为什么iOS有 UIKit和 UIView ，但是Mac OS有AppKit和 NSView 的原因。他们功能上很相似， 但是在实现上有着显著的区别。
  ```

### 2.4 图层的能力

```
如果说 CALayer 是 UIView 内部实现细节，那我们为什么要全面地了解它呢？
苹果当然为我们提供了优美简洁的 UIView 接口，那么我们是否就没必要直接去处
理Core Animation的细节了呢？
```

***某种意义上说的确是这样，对一些简单的需求来说，确实没必要处理 CALayer ，因为苹果已经通过 UIView 的高级API间接地使得动画变得很简单。但是这种简单会不可避免地带来一些灵活上的缺陷。如果你略微想在底层做一些改变，或者使用一些苹果没有在 UIView 上实现的接口功能，这时除了介入Core Animation底层之外别无选择。***

* 阴影，圆角，带颜色的边框 (shadow, layer, cornerRadius)
* 3D变换 (transform)
* 非矩形范围 
* 透明遮罩
* 多级非线性动画

### 2.5 使用图层

给视图添加一个蓝色子图层，代码如下：

