//
//  IndentComments.m
//  IndentComments
//
//  Created by Jobs on 15/12/8.
//  Copyright © 2015年 Jobs. All rights reserved.
//

#import "IndentComments.h"
#import "DVTSourceLanguageService+Hook.h"

@interface IndentComments()
@end


@implementation IndentComments

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    // Load only into Xcode
    NSString *identifier = [NSBundle mainBundle].bundleIdentifier;
    if (![identifier isEqualToString:@"com.apple.dt.Xcode"]) {
        return;
    }
    
    [self sharedPlugin];
}


+ (instancetype)sharedPlugin
{
    static IndentComments *_sharedPlugin;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedPlugin = [[self alloc] init];
    });
    
    return _sharedPlugin;
}


- (instancetype)init
{
    if (self = [super init]) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidFinishLaunching:) name:NSApplicationDidFinishLaunchingNotification object:nil];
    }
    
    return self;
}


- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    
    [self addPluginsMenu];
    
    [DVTSourceLanguageService hook];
}


- (void)addPluginsMenu
{
    // Add Plugins menu next to Window menu
    NSMenu *mainMenu = [NSApp mainMenu];
    NSMenuItem *pluginsMenuItem = [mainMenu itemWithTitle:@"Window"];
    //if (!pluginsMenuItem) {
        //pluginsMenuItem = [[NSMenuItem alloc] init];
        //pluginsMenuItem.title = @"Plugins";
        //pluginsMenuItem.submenu = [[NSMenu alloc] initWithTitle:pluginsMenuItem.title];
        //NSInteger windowIndex = [mainMenu indexOfItemWithTitle:@"Window"];
        //[mainMenu insertItem:pluginsMenuItem atIndex:windowIndex];
    //}
    
    
    [pluginsMenuItem.submenu addItem:[NSMenuItem separatorItem]];
    
    // Add Subitem
    NSMenuItem *subMenuItem = [[NSMenuItem alloc] init];
    subMenuItem.title = @"注释对齐";
    subMenuItem.target = self;
    subMenuItem.action = @selector(toggleMenu:);
    subMenuItem.state = NSOnState;
    [pluginsMenuItem.submenu addItem:subMenuItem];
}


- (void)toggleMenu:(NSMenuItem *)menuItem
{
    menuItem.state = !menuItem.state;
    [DVTSourceLanguageService hook];
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
