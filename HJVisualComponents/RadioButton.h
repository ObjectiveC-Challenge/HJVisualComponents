//
//  UIView+RadioButton.h
//  POC-RadioButton
//
//  Created by Helaine Pontes on 22/07/21.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface RadioButton: UIView{
    CGFloat multiplier;
    UIColor *selectedColor, *unselectedColor, *fontColor;
    NSArray *names;
    NSArray *buttons;
    long selectedButton;
}
@property (readonly) NSArray *buttons;
@property (readonly) long selectedButton;

/// @brief Button's color when it is selected
@property (nonatomic) IBInspectable UIColor *selectedColor;

/// @brief Labels's color
@property (nonatomic) IBInspectable UIColor *fontColor;

/// @brief Button's color when it is not selected
@property (nonatomic) IBInspectable UIColor *unselectedColor;

/// @brief Button's size relative to parent view.
@property (nonatomic) IBInspectable CGFloat multiplier;

/// @brief Configure the radio buttons with custom design.
/// @param multiplierP CGFloat that represents button size relative to parent view.
/// @param selectedColorP UIColor * that represents button color when selected.
/// @param unselectedColorP UIColor * that represents button color when not selected
/// @param fontColorP UIColor * that represents color of the label below the button
/// @returns RadioButton
-(instancetype)initWithMultiplier:(CGFloat)multiplierP selectedColor:(UIColor*)selectedColorP unselectedColor:(UIColor*)unselectedColorP fontColor:(UIColor*)fontColorP;

/// @brief Configure the quantity and values of radio button's options. The options must be a String Array.
/// @discussion Note that the namesP variable must be a type that can be converted to NSString.
/// @param namesP NSArray .
-(void)setOptions:(NSArray*)namesP;


/// @brief Return the selected option. If there aren't select options, this function returns nil.
/// @returns Return the type that was set in the funcion setOptions() or nil.
-(id)getSelectedValue;
@end

