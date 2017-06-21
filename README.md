# Routable-ReverseValue

Routable-ReverseValue是基于Routable框架添加了几个新的功能。

# 用法

1. 设置控制器的URL

    ```
    [[Routable sharedRouter] map:@"users" toController:[UserController class]];
    ```

2. 在你的viewController中实现*initWithRouterParams:*方法

    ```
    - (id)initWithRouterParams:(NSDictionary *)params {
        if ((self = [self initWithNibName:nil bundle:nil])) {
            self.userId = [params objectForKey:@"id"];
        }
        return self;
    }
    ```
    
3. 跳转到URL对应的控制器

    ```
    [[Routable sharedRouter] open:@"users"];
    ```

## 添加的格外功能

1. 原Routable框架需要手动设置navigationController

    ```
    [[Routable sharedRouter] setNavigationController:aNavigationController];
    ```
    
    因为Routable本质是通过navigationController进行push或pop操作。我们现在分析把Routable的navigationController设成固定值。
    
    主流App架构：
    
    ```
                        |-> NavigationController1 -> ViewController1
    TabBarController -> |-> NavigationController2 -> ViewController2
                        |-> NavigationController3 -> ViewController3

    ```
    
    如果在*application:didFinishLaunchingWithOptions:*中把Routable的navigationController设成固定值，那么App架构变成了这样：
    
    ```
                                                         |-> NavigationController1 -> ViewController1
    Routable.navigationController -> TabBarController -> |-> NavigationController2 -> ViewController2
                                                         |-> NavigationController3 -> ViewController3

    ```
    
    这样导致ViewController1、ViewController2、ViewController3的navigationItem被Routable.navigationController遮住了。并且ViewController1跳转到ViewController2不再是由NavigationController1去控制，而是被Routable.navigationController管理，这样导致各个ViewController的navigationItem设置出问题。
    
    
    把Routable.navigationController设成当前所在的控制器，则App架构是这样的：
    
    ```
                        |-> NavigationController1 -> ViewController1 | Routable.navigationController -> NavigationController1
    TabBarController -> |-> NavigationController2 -> ViewController2 | Routable.navigationController -> NavigationController2
                        |-> NavigationController3 -> ViewController3 | Routable.navigationController -> NavigationController3
    ```
    
    ViewController1跳转到ViewController2时，这时我在Routable内部做了以下事情：
    
    ```
    // 处理navigationController
    UIViewController *currentController = [UIViewController currentViewController];
    if ([currentController isKindOfClass:[UIViewController class]]) {
        if (currentController.navigationController) {
            self.navigationController = currentController.navigationController;
        } else {
            self.navigationController = [[UINavigationController alloc] init];
        }
    } else if ([currentController isKindOfClass:[UINavigationController class]]) {
        self.navigationController = (UINavigationController *)currentController;
    } else {
        self.navigationController = [[UINavigationController alloc] init];
    }

    ```
    
    这样ViewController1跳转ViewController2，则由NavigationController1负责；反过来ViewController2跳转ViewController1，则由NavigationController2负责。

    所有Routable-ReverseValue不需要手动配置Routable.navigationController，它会根据当前所在的Controller做对应的处理。

2. 逆向传值

    添加了NSObject+ReverseValue分类，然后在该分类中添加遵守JCReverseValueProtocol协议的属性，只要*#import "Routable.h"*即可。

    ```
    // ViewController1
    [[Routable sharedRouter] open:@"ViewController2"
                         animated:YES
                      extraParams:@{@"title" : @"come from ViewController1"}
                   delegateObject:self];
                   
                   
    - (void)jc_reverseValue:(id)value {
        NSLog(@"%s:%@", __FUNCTION__, value);
    }
    ```

    ```
    // ViewController2
    if ([self.JCReverseValueDelegate respondsToSelector:@selector(jc_reverseValue:)]) {
        [self.JCReverseValueDelegate jc_reverseValue:@"come from ViewController2"];
    }
    ```

3. 用户注销返回登录界面

    ```
    // 参数为登录界面控制器的类名
    [Routable unRegisterAccountToLoginViewController:@"LoginViewController"];
    ```

