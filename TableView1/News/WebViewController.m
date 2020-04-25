//
//  WebViewController.m
//  TableView1
//
//  Created by bytedance on 2020/4/20.
//  Copyright © 2020 df. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import "GTScreen.h"
#import "GTMediator.h"
@interface WebViewController ()<WKNavigationDelegate>
@property (strong,nonatomic,readwrite) WKWebView *webView;
@property (strong,nonatomic) NSString* urlString;
@end

@implementation WebViewController

//在mediator中注册
//urlscheme
+ (void)load{
    [GTMediator registerScheme:@"detail://" processBlock:^(NSDictionary* _Nonnull params){
        UINavigationController *navigationController = (UINavigationController *)[params objectForKey:@"controller"];
        NSString *url = [params objectForKey:@"url"];
        WebViewController *controller = [[WebViewController alloc] initWithUrlString:url];
        [navigationController pushViewController:controller animated:YES];
    }];
}

//protocol-class
//-(void)load{
//    [GTMediator registerProtocol:@protocol(WebViewControllerProtocol) class:[self class]];
//}
//- (id)initWithUrlString:(NSString*) urlString
//{
//    self = [super init];
//    if(self){
//        self.urlString = urlString.copy;
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor=[UIColor whiteColor];
   self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0,88 , self.view.frame.size.width, self.view.frame.size.height-88)];
   //self.webView.backgroundColor=[UIColor redColor];
   [self.view addSubview:self.webView];
  // self.webView.navigationDelegate = self;
   [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
  // [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
//   [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
   //[self.webView reload];
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
    //NSLog(@"");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"finish");
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(nonnull NSError *)error
{
    NSLog(@"error");
}

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"listen");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
