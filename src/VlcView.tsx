import VlcViewNative, {
  Commands,
  type NativeProps,
} from './VlcViewNativeComponent';
import React, { forwardRef, useImperativeHandle, useRef } from 'react';

export type VlcViewRef = {
  seek: (time: number) => void;
};

export const VlcView = forwardRef<VlcViewRef, NativeProps>((props, ref) => {
  const nativeRef = useRef(null);

  useImperativeHandle(
    ref,
    () => ({
      seek(time: number) {
        Commands.seek(nativeRef.current!, time);
      },
    }),
    []
  );

  return (
    <VlcViewNative
      {...props}
      ref={(_ref) => {
        nativeRef.current = _ref;
      }}
    />
  );
});
