import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';

interface NativeProps extends ViewProps {
  /**
   * The source of the media to play.
   * You can use a URL or a file path.
   * @example 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
   */
  src: string;
  /**
   * Is the media playing?
   */
  playing: boolean;
}

export default codegenNativeComponent<NativeProps>('VlcView');
