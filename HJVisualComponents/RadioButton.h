//
//  UIView+RadioButton.h
//  POC-RadioButton
//
//  Created by Helaine Pontes on 22/07/21.
//

#import <UIKit/UIKit.h>

@interface RadioButton: UIView{
    CGFloat multiplier;
    UIColor *selectedColor, *unselectedColor, *fontColor;
    NSArray *names;
    NSArray *buttons;
    long selectedButton;
}
@property (readonly) NSArray *buttons;
@property (readonly) long selectedButton;

-(instancetype)initWithMultiplier:(CGFloat)multiplierP selectedColor:(UIColor*)selectedColorP unselectedColor:(UIColor*)unselectedColorP fontColor:(UIColor*)fontColorP;
-(void)setOptions:(NSArray*)namesP;
-(NSString*)getSelectedLabel;
@end

