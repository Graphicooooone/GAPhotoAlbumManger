//
//  ViewController.m
//  GAPhotoAlbumManger
//
//  Created by Graphic-one on 16/8/5.
//  Copyright © 2016年 Graphic-one. All rights reserved.
//

#import "ViewController.h"
#import "GAPhotoAlbumManger/GAPhotoAlbumManger.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageContainer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)touchDownloadBtn:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"下载图片至手机相册" message:@"" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];

    [alertView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        UIActivityIndicatorView* indicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        indicatorView.frame = (CGRect){{self.view.center.x - 20 , self.view.center.y - 20},{40,40}};
        indicatorView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.670];
        indicatorView.clipsToBounds = YES;
        indicatorView.layer.cornerRadius = 6;
        [indicatorView startAnimating];
        
        UIImage* image = self.imageContainer.image;
        if (image) {
            GAPhotoAlbumManger* photoManger = [GAPhotoAlbumManger sharePhotoAlbumManger];
            [photoManger saveImage:image albumName:@"customAlbum" completeHandle:^(NSError *error, BOOL isHasAuthorized) {
                if (isHasAuthorized) {
                    if (!error) {
                        NSLog(@"save success");
                    }
                }else{
                    NSLog(@"Do not have permission to");
                }
                [indicatorView removeFromSuperview];
            }];
        }else{
            [indicatorView removeFromSuperview];
        }
    }
}

@end
