//
//  JFMyPlayerSound.h
//  audioSound
//
//  Created by admin on 16/8/25.
//  Copyright © 2016年 anxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface JFMyPlayerSound : NSObject
{
    SystemSoundID sound;//系统声音的id 取值范围为：1000-2000
}
/**
 *  系统震动
 */
-(id)initSystemShake;


/**
 *  初始化系统声音
 */
-(id)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType;

/**
 *  播放
 */
- (void)play;

@end
