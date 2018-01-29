//
//  ODRightMenuCell.m
//  orodnaa
//
//  Created by iMokhles on 13/12/2016.
//  Copyright © 2016 imokhles. All rights reserved.
//

#import "ODRightMenuCell.h"

@implementation ODRightMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setBackgroundColor:[UIColor clearColor]];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    
    [self.cellLabel setFont:[UIFont fontWithName:@"Cairo-Regular" size:20]];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
