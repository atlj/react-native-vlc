import MobileVLCKit

public class VlcViewSwift: NSObject {
    @objc public let view = UIView()
    let mediaPlayer = VLCMediaPlayer()
    var currentMedia: VLCMedia? {
        didSet {
            mediaPlayer.media = currentMedia
            mediaPlayer.play()
        }
    }

    @objc public init(url: NSURL){
        mediaPlayer.drawable = self.view
        currentMedia = VLCMedia(url: url as URL)
        mediaPlayer.media = currentMedia
        mediaPlayer.play()
    }
}
