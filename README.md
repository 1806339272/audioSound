# audioSound
Call the system mobile phone ring, play the system bell, judge whether the user is on the silent mode
help:http://www.jianshu.com/p/ce8f1a890892

/**
 *  初始化系统声音
 */

-(id)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType
{
    self = [super init];
    if (self) {
        NSString *path = [NSString stringWithFormat:@"/System/Library/Audio/UISounds/%@.%@",soundName,soundType];
        if (path) {
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path],&sound);
            if (error != kAudioServicesNoError) {//获取的声音的时候，出现错误
                NSLog(@"静音");
                sound = nil;
            }
        }
    }
    return self;
}



//创建
        NSString *name = [NSString stringWithFormat:@"%@",self.dataSource2[_selecetIndexpath.row]];
        self.myPlaySounde = [[JFMyPlayerSound alloc] initSystemSoundWithName:name SoundType:@"caf"];
        
        [self.myPlaySounde play];
