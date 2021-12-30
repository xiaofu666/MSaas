//
//  ADTableViewCell.m
//  TestAdA
//
//  Created by lurich on 2020/4/4.
//  Copyright © 2020 YX. All rights reserved.
//

#import "ADTableViewCell.h"

@implementation ADTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.infoBtn.layer.masksToBounds = YES;
        self.infoBtn.layer.borderColor =  [UIColor colorWithRed:208/255.0 green:0 blue:0 alpha:1].CGColor;
    self.infoBtn.layer.borderWidth = 1;
    self.infoBtn.layer.cornerRadius = 4;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
