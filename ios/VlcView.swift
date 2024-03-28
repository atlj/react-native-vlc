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
        get {
            mediaPlayerDelegate.onProgress
        }
        set {
            mediaPlayerDelegate.onProgress = newValue
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
    
    @objc public func seek(_ position: Double) {
        guard let currentMedia = currentMedia else {
            return
        }
        
    }
}

class PlayerDelegate: NSObject, VLCMediaPlayerDelegate {
    public var onProgress: OnProgress?
    
    public func mediaPlayerTimeChanged(_ aNotification: Notification!) {
        let player = aNotification.object as! VLCMediaPlayer
        let progress = Double(player.position)
        let duration = Double(player.media.lengthWait(until: .distantFuture).intValue)
        
        var progressEvent = ProgressEvent(progress: progress, duration: duration)
        
        guard let onProgress = onProgress else {
            return
        }
        
        onProgress(&progressEvent)
    }
}
