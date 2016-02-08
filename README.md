AMTumblrHud
===========

Progress HUD inspired by Tumblr app.

<img src="https://raw.github.com/Asich/AMTumblrHud/master/Screenshots/AMTumblrHUD.gif" width="320" />

## Installation

Add the `AMTumblrHud.h` and `AMTumblrHud.m` source files to your project.

1. Download the latest code version or add the repository as a git submodule to your git-tracked project.
2. Open your project in Xcode, then drag and drop `AMTumblrHud.h` and `AMTumblrHud.m` onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project.
3. Include AMTumblrHud wherever you need it with `#import "AMTumblrHud.h"`

Or use **Cocoapods:**

pod 'AMTumblrHud', '1.0.0'

## Usage

```objective-c
AMTumblrHud *tumblrHUD = [[AMTumblrHud alloc] initWithFrame:CGRectMake(100, 100, 55, 20)];
tumblrHUD.hudColor = UIColorFromRGB(0xF1F2F3); //[UIColor magentaColor];
[self.view addSubview:tumblrHUD];

[tumblrHUD showAnimated:YES];
```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE). 

