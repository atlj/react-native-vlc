import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { ViewProps } from 'react-native';
import type {
  BubblingEventHandler,
  Double,
} from 'react-native/Libraries/Types/CodegenTypes';

export type ProgressEvent = Readonly<{
  currentTime: Double;
  totalTime: Double;
}>;

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
  onProgress: BubblingEventHandler<ProgressEvent>;
}

export default codegenNativeComponent<NativeProps>('VlcView');
