import MobileVLCKit

public class VlcViewSwift: NSObject {
    @objc public let view = UIView()
    @objc public var playing: Bool {
        get {
            mediaPlayer.isPlaying
        }
        set (isPlaying) {
            if isPlaying {
                mediaPlayer.play()
            } else {
                mediaPlayer.pause()
            }
        }
    }
    let mediaPlayer = VLCMediaPlayer()
    var currentMedia: VLCMedia? {
        didSet {
            mediaPlayer.stop()
            mediaPlayer.media = currentMedia
        }
    }
    let mediaPlayerDelegate = PlayerDelegate()
    @objc public var onProgress: OnProgress? {
        didSet {
            mediaPlayerDelegate.onProgress = onProgress
        }
    }

    @objc public override init() {
        super.init()
        mediaPlayer.drawable = self.view
        mediaPlayer.delegate = self.mediaPlayerDelegate
    }
    
    
    @objc public func setSrc(_ src: NSURL) {
        currentMedia = VLCMedia(url: src as URL)
    }
}

class PlayerDelegate: NSObject, VLCMediaPlayerDelegate {
    public var onProgress: OnProgress?
    
    public func mediaPlayerTimeChanged(_ aNotification: Notification!) {
        let player = aNotification.object as! VLCMediaPlayer
        let currentTime = Double(player.position)
        let totalTime = Double(player.media.lengthWait(until: .distantFuture).intValue)
        
        var progressEvent = ProgressEvent(currentTime: currentTime, totalTime: totalTime)
        
        guard let onProgress = onProgress else {
            return
        }
        
        onProgress(&progressEvent)
    }
}
