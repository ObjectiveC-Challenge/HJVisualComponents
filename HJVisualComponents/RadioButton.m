//
//  UIView+RadioButton.m
//  POC-RadioButton
//
//  Created by Helaine Pontes on 22/07/21.
//

#import "RadioButton.h"

@implementation RadioButton: UIView

- (id)initWithMultiplier:(CGFloat)multiplierP selectedColor:(UIColor *)selectedColorP unselectedColor:(UIColor *)unselectedColorP fontColor:(UIColor *)fontColorP orientation:(Orientation)orientationP {
    if ((self = [super init])) {
        multiplier = multiplierP;
        selectedColor = selectedColorP;
        unselectedColor = unselectedColorP;
        fontColor = fontColorP;
        orientation = orientationP;
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
    orientation = horizontal;
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


-(id)getSelectedValue {
    return selectedButton < 0 ? nil : names[selectedButton];
}

- (void)setOptions:(NSArray *)namesP {
    names = namesP;
}

-(void)setUpRadioButtons {
    CGFloat columnSize;
    CGFloat step;
    
    switch (orientation) {
        case horizontal:
            columnSize = self.frame.size.width / names.count;
            step = columnSize/2;
            break;
        case vertical:
            columnSize = self.frame.size.height / names.count;
            step = columnSize/2;
            break;
    }
    
    for (int i = 0; i < names.count; i++) {
        UIButton *newButton = [self setUpButton];
        [newButton setTag:i+1];
        UILabel *newLabel = [self setUpLabel:names[i]];
        
        [self setUPConstraints:newButton withLabel:newLabel withPosition:step+(columnSize*i)];
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

-(void) setUPConstraints:(UIButton*)newButton withLabel:(UILabel*)newLabel withPosition:(CGFloat)position {
    [self addSubview:newButton];
    [self addSubview:newLabel];
    
    newButton.translatesAutoresizingMaskIntoConstraints = NO;
    newLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [newLabel.widthAnchor constraintLessThanOrEqualToConstant: (self.frame.size.width/names.count)-5].active = YES;
    
    switch (orientation) {
        case horizontal:
            [newButton.centerXAnchor constraintEqualToAnchor:self.leftAnchor constant:position].active = YES;
            [newButton.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
            [newButton.heightAnchor constraintEqualToAnchor:self.heightAnchor multiplier:multiplier].active = YES;
            [newButton.widthAnchor constraintEqualToAnchor:self.heightAnchor multiplier:multiplier].active = YES;
            
            [newLabel.topAnchor constraintEqualToAnchor:newButton.bottomAnchor constant:5].active = YES;
            [newLabel.centerXAnchor constraintEqualToAnchor:newButton.centerXAnchor].active = YES;
            break;
            
        case vertical:
            [newButton.centerYAnchor constraintEqualToAnchor:self.topAnchor constant:position].active = YES;
            [newButton.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
            [newButton.heightAnchor constraintEqualToAnchor:self.widthAnchor multiplier:multiplier].active = YES;
            [newButton.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:multiplier].active = YES;
            
            [newLabel.leftAnchor constraintEqualToAnchor:newButton.rightAnchor constant:5].active = YES;
            [newLabel.centerYAnchor constraintEqualToAnchor:newButton.centerYAnchor].active = YES;
            break;
    }
}


@end
