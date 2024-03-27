import React from 'react';
import { View, type ViewProps } from 'react-native';
import Animated, {
  useAnimatedStyle,
  type SharedValue,
} from 'react-native-reanimated';

export function ProgressBar({
  progress,
  style,
}: {
  progress: SharedValue<number>;
  style: ViewProps['style'];
}) {
  const animatedStyle = useAnimatedStyle(() => ({
    width: `${progress.value * 100}%`,
  }));

  return (
    <View
      style={[
        style,
        {
          paddingHorizontal: 20,
          alignSelf: 'center',
          width: '100%',
        },
      ]}
    >
      <View
        style={{
          backgroundColor: 'rgba(255, 255, 255, 0.3)',
          borderRadius: 999,
          height: 8,
        }}
      >
        <Animated.View
          style={[
            {
              backgroundColor: 'white',
              height: '100%',
              borderRadius: 999,
            },
            animatedStyle,
          ]}
        />
      </View>
    </View>
  );
}
