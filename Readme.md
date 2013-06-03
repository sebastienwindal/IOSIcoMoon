# IOS Ico Moon 

Use an ICOMoon generated icon font in your IOS app!

Font-awesome and other icon fonts are just awesome. ICOMoon (a web app that lets you hand pick
glyphs from multiple icon fonts and generate a custom font file that contains only the selected glyphs)
is beyond awesome!

Here is how I use that stuff in my apps:

## 1. Generate a custom icon font using the icomoon app 

* Go here: [http://icomoon.io/app/](http://icomoon.io/app/)
* Select icons from various font
* Click the Font button at the bottom to generate the font
* click download

For instance here I selected 5 icons from 5 different font:

![icons](Icons.png)


## 2. Generate code

* Go to the fonts folder in the downloaded zip.
* Run the generateHeader.py python script provided in the repo...

This script will parse the icomoon.dev.svg file and create a new file ```IcomoonIcons.h``` with a bunch of #defines
in it.

For instance, the previous icon set will generate those 5 #defines:

```C
#define  ICOMOON_BUBBLES "\uE000"
#define  ICOMOON_TARGET "\uE001"
#define  ICOMOON_SNOWY "\uE002"
#define  ICOMOON_MUSIC "\uF001"
#define  ICOMOON_CHART "\uE003"
```

# 3. Use it in your app

* Add the ```IcomoonIcons.h``` file and the ttf font file icomoon.ttf in your app project.
* Make sure your add an entry in your app ```info.plist``` for the ```icomoon.ttf``` font file 
("Fonts provided by application"/UIAppFonts row).
* Add the ```IcoMoon.m``` and ```IcoMoon.h``` to your project. This class is a very simple class that imports the generated 
```IcomoonIcons.h``` and that contains only one method:

```obj-c
+(NSString *)iconString:(char *)icon
{
    NSString *string = [NSString stringWithUTF8String:icon];
    return string;
}
```

In your app, you can now transform a UILabel into an icon:

```obj-c
[self.label setFont:[UIFont fontWithName:@"icomoon" size:64.0f]];
self.label.text = [IcoMoon iconString:ICOMOON_BUBBLES];
```

![app](iPhone.png)

Look at the ExampleApp project to see it in action.

I guess you could make the generation of the ```IcomoonIcons.h``` file a custom build phase 
so everything is updated after you update the font. Feel free to send me a pull request...