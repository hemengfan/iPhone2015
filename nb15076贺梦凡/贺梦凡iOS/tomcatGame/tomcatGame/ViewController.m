//
//  ViewController.m
//  tomcatGame
//
//  Created by wanghaobo on 16/1/5.
//  Copyright © 2016年 hemengfan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tomcatImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)fart:(UIButton *)sender
{
    [self tomAnimateWith:@"fart" andImageCount:27];
}
- (IBAction)eat:(UIButton *)sender
{
    [self tomAnimateWith:@"eat" andImageCount:40];
}
- (IBAction)milk:(UIButton *)sender
{
    [self tomAnimateWith:@"drink" andImageCount:81];

}
- (IBAction)cymbal:(UIButton *)sender
{
    [self tomAnimateWith:@"cymbal" andImageCount:13];

}
- (IBAction)pie:(UIButton *)sender
{
    [self tomAnimateWith:@"pie" andImageCount:24];

}
- (IBAction)scratch:(UIButton *)sender
{
    [self tomAnimateWith:@"scratch" andImageCount:56];
}
- (IBAction)touchHead:(UIButton *)sender
{
    [self tomAnimateWith:@"knockout" andImageCount:81];
}
- (IBAction)leftFoot:(UIButton *)sender
{
    [self tomAnimateWith:@"footLeft" andImageCount:30];
}
- (IBAction)rightFoot:(UIButton *)sender
{
    [self tomAnimateWith:@"footRight" andImageCount:30];
}
- (IBAction)stomach:(UIButton *)sender
{
    [self tomAnimateWith:@"stomach" andImageCount:34];
}

- (void)tomAnimateWith:(NSString *)fileName andImageCount:(NSInteger)imageCount
{
    if (self.tomcatImageView.isAnimating){
        return;
    }
    NSMutableArray *tomImages = [NSMutableArray array];
    for (int i = 0; i < imageCount; i ++)
    {
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg",fileName,i];
        NSString *path = [[NSBundle mainBundle]pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        
        [tomImages addObject:image];
    }
    [self.tomcatImageView setAnimationImages:tomImages];
    
    [self.tomcatImageView setAnimationDuration:self.tomcatImageView.animationImages.count * 0.1];
    
    [self.tomcatImageView setAnimationRepeatCount:1];
    
    [self.tomcatImageView startAnimating];
    
    [self performSelector:@selector(clearImage) withObject:nil afterDelay:self.tomcatImageView.animationDuration];
}
- (void)clearImage
{
    self.tomcatImageView.animationImages = nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
