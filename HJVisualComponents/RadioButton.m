//
//  UIView+RadioButton.m
//  POC-RadioButton
//
//  Created by Helaine Pontes on 22/07/21.
//

#import "RadioButton.h"

@implementation RadioButton: UIView

/// @brief  Configure the radio buttons with custom design.
/// @param multiplierP CGFloat that represents button size relative to parent view.
/// @param selectedColorP UIColor * that represents button color when selected.
/// @param unselectedColorP UIColor * that represents button color when not selected
/// @param fontColorP UIColor * that represents color of the label below the button
/// @returns RadioButton
- (id)initWithMultiplier:(CGFloat)multiplierP selectedColor:(UIColor *)selectedColorP unselectedColor:(UIColor *)unselectedColorP fontColor:(UIColor *)fontColorP {
    if ((self = [super init])) {
        multiplier = multiplierP;
        selectedColor = selectedColorP;
        unselectedColor = unselectedColorP;
        fontColor = fontColorP;
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self baseInit];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setUpRadioButtons];
}

-(void) baseInit {
    multiplier = 0.5;
    selectedColor = [UIColor blackColor];
    unselectedColor = [UIColor grayColor];
    fontColor = [UIColor blackColor];
    buttons = [[NSArray alloc] init];
    selectedButton = -1;
}

-(void)wasTapped:(UIButton*)sender {
    if(selectedButton >= 0) {
        UIButton* button = buttons[selectedButton];
        [button setBackgroundImage:[UIImage systemImageNamed:@"circle"] forState:(UIControlStateNormal)];
        button.tintColor = unselectedColor;
    }
    selectedButton = [sender tag] - 1;
    [sender setBackgroundImage:[UIImage systemImageNamed:@"largecircle.fill.circle"] forState:(UIControlStateNormal)];
    sender.tintColor = selectedColor;
}



/// @brief Return the selected option. If there aren't select options, this function returns nil.
/// @returns Return the type that was set in the funcion setOptions() or nil.
-(id)getSelectedValue {
    return selectedButton < 0 ? nil : names[selectedButton];
}

/// @brief Configure the quantity and values of radio button's options. The options must be a String Array.
/// @discussion Note that the namesP variable must be a type that can be converted to NSString.
/// @param namesP NSArray .
- (void)setOptions:(NSArray *)namesP {
    names = namesP;
}

-(void)setUpRadioButtons {
    CGFloat columnSize = self.frame.size.width / names.count;
    CGFloat step = columnSize/2;
    
    for (int i = 0; i < names.count; i++) {
        UIButton *newButton = [self setUpButton];
        [newButton setTag:i+1];
        UILabel *newLabel = [self setUpLabel:names[i]];
        
        [self setUPConstraints:newButton withLabel:newLabel withXPosition:step+(columnSize*i)];
    }
}


-(UIButton*) setUpButton {
    UIButton *newButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [newButton addTarget:self
            action:@selector(wasTapped:)
            forControlEvents:UIControlEventTouchUpInside
     ];

    [newButton setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];
    [newButton setBackgroundImage:[UIImage systemImageNamed:@"circle"] forState:(UIControlStateNormal)];
    newButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    newButton.tintColor = unselectedColor;
    
    buttons = [buttons arrayByAddingObject:newButton];
    
    return newButton;
}

-(UILabel*) setUpLabel: (id)name {
    UILabel *newLabel = [[UILabel alloc] init];
    NSMutableString * result = [[NSMutableString alloc] init];
    [result appendString:[name description]];
    
    newLabel.text = result;
    newLabel.textColor = fontColor;
    newLabel.textAlignment = NSTextAlignmentLeft;
    return newLabel;
}

-(void) setUPConstraints:(UIButton*)newButton withLabel:(UILabel*)newLabel withXPosition:(CGFloat)xPosition {
    [self addSubview:newButton];
    [self addSubview:newLabel];

    newButton.translatesAutoresizingMaskIntoConstraints = NO;
    [newButton.centerXAnchor constraintEqualToAnchor:self.leftAnchor constant:xPosition].active = YES;
    [newButton.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [newButton.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:multiplier].active = YES;
    [newButton.widthAnchor constraintEqualToAnchor:self.heightAnchor multiplier:multiplier].active = YES;
    
    newLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [newLabel.topAnchor constraintEqualToAnchor:newButton.bottomAnchor constant:5].active = YES;
    [newLabel.centerXAnchor constraintEqualToAnchor:newButton.centerXAnchor].active = YES;
    [newLabel.widthAnchor constraintLessThanOrEqualToConstant: (self.frame.size.width/names.count)-5].active = YES;
}

@end
