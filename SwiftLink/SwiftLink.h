#import <Foundation/Foundation.h>

@interface AbletonLink : NSObject

@property (nonatomic) double bpm;
@property NSUInteger onNumPeers;
@property bool onStartStop;
@property double onTempo;

- (id) initWithBpm:(double)bpm;
- (bool) isEnabled;
- (bool) isStartStopSyncEnabled;
- (void) enableStartStopSync:(bool)bEnable;
- (void) enable:(bool)bEnable;
- (double) tempo;
- (void) setTempo:(double)bpm;
- (NSUInteger) numPeers;
- (void) initCallbacks;

@end
