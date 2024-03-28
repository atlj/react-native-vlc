import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import type { HostComponent, ViewProps } from 'react-native';
import type {
  BubblingEventHandler,
  Double,
} from 'react-native/Libraries/Types/CodegenTypes';
import codegenNativeCommands from 'react-native/Libraries/Utilities/codegenNativeCommands';

export type ProgressEvent = Readonly<{
  progress: Double;
  duration: Double;
}>;

export interface NativeProps extends ViewProps {
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

type VlcView = HostComponent<NativeProps>;
interface NativeCommands {
  seek: (viewRef: React.ElementRef<VlcView>, position: Double) => void;
}

export const Commands = codegenNativeCommands<NativeCommands>({
  supportedCommands: ['seek'],
});
