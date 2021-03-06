//
//  WebViewViewController.m
//  PullRefreshControl
//
//  Created by YDJ on 14/12/1.
//  Copyright (c) 2014年 YDJ. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()<RefreshControlDelegate>

@property (nonatomic,strong)UIWebView *webView;
@property (nonatomic,strong)RefreshControl *refreshControl;
@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _webView=[[UIWebView alloc] initWithFrame:CGRectZero];
    _webView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:_webView];
    
    NSArray *h=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[webView]-0-|" options:0 metrics:nil views:@{@"webView":_webView}];
    NSArray *v=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[webView]-0-|" options:0 metrics:nil views:@{@"webView":_webView}];
    
    [self.view addConstraints:h];
    [self.view addConstraints:v];
    
    
    NSURLRequest * req=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
    
    [_webView loadRequest:req];
    
    
    _refreshControl=[[RefreshControl alloc] initWithScrollView:_webView.scrollView delegate:self];
    _refreshControl.topEnabled=YES;
    
    
    
}


- (void)refreshControl:(RefreshControl *)refreshControl didEngageRefreshDirection:(RefreshDirection) direction
{
    if (direction==RefreshDirectionTop) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [_refreshControl finishRefreshingDirection:RefreshDirectionTop];
            
        });
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
