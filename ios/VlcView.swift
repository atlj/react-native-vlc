import MobileVLCKit

public class VlcViewSwift: NSObject {
    @objc public let view = UIView()
    let mediaPlayer = VLCMediaPlayer()
    var currentMedia: VLCMedia? {
        didSet {
            mediaPlayer.stop()
            mediaPlayer.media = currentMedia
            mediaPlayer.play()
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
