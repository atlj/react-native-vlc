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

    @objc public override init() {
        super.init()
        mediaPlayer.drawable = self.view
    }
    
    @objc public func setSrc(_ src: NSURL) {
        currentMedia = VLCMedia(url: src as URL)
    }
}
