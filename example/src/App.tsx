import * as React from 'react';
import { useState } from 'react';

import { Button, SafeAreaView, StyleSheet, View } from 'react-native';
import { VlcView } from 'react-native-vlc';
import { VIDEOS, VideoPicker } from './VideoPicker';

export default function App() {
  const [showVideoSelector, setShowVideoSelector] = useState(false);
  const [selectedVideo, setSelectedVideo] = useState<(typeof VIDEOS)[number]>(
    VIDEOS[0]
  );
  const [isPlaying, setIsPlaying] = useState(true);

  return (
    <View style={styles.container}>
      <VlcView
        src={selectedVideo.source}
        playing={isPlaying}
        style={styles.box}
      />
      <SafeAreaView style={styles.buttonContainer}>
        <View style={styles.button}>
          <Button
            title="Select video"
            onPress={() => setShowVideoSelector(true)}
          />
          <Button
            title={isPlaying ? 'Pause' : 'Play'}
            onPress={() => setIsPlaying((prev) => !prev)}
          />
        </View>
      </SafeAreaView>
      <VideoPicker
        setSelectedVideo={setSelectedVideo}
        selectedVideo={selectedVideo}
        setShowVideoSelector={setShowVideoSelector}
        showVideoSelector={showVideoSelector}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: '100%',
    height: '100%',
  },
  buttonContainer: {
    position: 'absolute',
    height: '100%',
    justifyContent: 'flex-end',
  },
  button: {
    marginBottom: 8,
  },
});
