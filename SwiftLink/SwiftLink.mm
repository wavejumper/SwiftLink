#import "SwiftLink.h"
#import <Foundation/Foundation.h>
#import "ableton/Link.hpp"

#pragma mark -
#pragma mark AbletonLink

@interface AbletonLink ()

@property (nonatomic, readonly) ableton::Link* internal;

@end


@implementation AbletonLink: NSObject

#pragma mark -
#pragma mark Constructor

- (id)initWithBpm:(double)bpm {
    if( self = [super init])
    {
      _onNumPeers = 0;
      _onTempo = 0;
      _onStartStop = false;
      _internal = new ableton::Link(bpm);
    }
    
    return self;
}

#pragma mark -
#pragma mark Cleanup

- (void) dealloc
{
    delete _internal;
}

#pragma mark -
#pragma mark Instance methods (see Link.hpp)

- (bool) isEnabled {
    return self.internal->isEnabled();
}

- (void) enable:(bool)bEnable {
    self.internal->enable(bEnable);
}

- (bool) isStartStopSyncEnabled {
    return self.internal->isStartStopSyncEnabled();
}

- (void) enableStartStopSync:(bool)bEnable {
    self.internal->enableStartStopSync(bEnable);
}

- (NSUInteger) numPeers {
    return self.internal->numPeers();
}

- (double) tempo {
  const ableton::Link::SessionState state = self.internal->captureAppSessionState();
  return state.tempo();
}

- (void) setTempo:(double)bpm {
  ableton::Link::SessionState state = self.internal->captureAppSessionState();
  const ableton::Link::Clock clock = self.internal->clock();
  const std::chrono::microseconds now = clock.micros();
  state.setTempo(bpm, now);

  self.internal->commitAppSessionState(state);
}

- (void) initCallbacks {
  self.internal->setNumPeersCallback(^(const size_t numPeers) {
    self.onNumPeers = numPeers;
  });
 
  self.internal->setTempoCallback(^(const double tempo) {
    self.onTempo = tempo;
  });
  
  self.internal->setStartStopCallback(^(const bool isPlaying) {
    self.onStartStop = isPlaying;
  });
}

@end
